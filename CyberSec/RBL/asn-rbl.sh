#!/bin/bash
# rbl-asn.sh
# Cek ASN ke RBL (bisa sampling atau expand all IP) tanpa ipcalc

ASN=$1
MODE=${2:-sample} # sample / full
DATE=$(date +"%d-%m-%Y")
OUTPUT_FILE="rbl-asn-${ASN}-${MODE}-${DATE}.txt"

if [[ -z "$ASN" ]]; then
  echo "Usage: $0 <ASN> [sample|full]"
  exit 1
fi

# Daftar RBL (bisa di-externalkan ke file rbl-list.txt)
RBL_LIST=(
  "dnsbl-1.uceprotect.net"
  "dnsbl-2.uceprotect.net"
  "dnsbl-3.uceprotect.net"
)

# Fungsi cek IP ke RBL
check_ip() {
  local IP=$1
  if [[ -z "$IP" ]]; then
    return
  fi

  local REVERSED_IP=$(echo $IP | awk -F. '{print $4"."$3"."$2"."$1}')
  local STATUS="Clean"

  echo -e "\nChecking $IP..." | tee -a "$OUTPUT_FILE"

  for RBL in "${RBL_LIST[@]}"; do
    RESULT=$(dig +short "${REVERSED_IP}.${RBL}" A @8.8.8.8)
    if [[ -n "$RESULT" ]]; then
      echo "[LISTED] $IP blacklisted on $RBL ($RESULT)" | tee -a "$OUTPUT_FILE"
      STATUS="Blacklisted"
    else
      echo "[CLEAN]  $IP not listed on $RBL" >> "$OUTPUT_FILE"
    fi
  done

  echo "Summary for $IP: $STATUS" | tee -a "$OUTPUT_FILE"
  echo "-------------------------------------" >> "$OUTPUT_FILE"
}

# Ambil prefix ASN dari RADB
PREFIXES=$(whois -h whois.radb.net -- "-i origin $ASN" | grep -Eo "([0-9.]+){4}/[0-9]+" | sort -u)

if [[ -z "$PREFIXES" ]]; then
  echo "Tidak ada prefix ditemukan untuk $ASN"
  exit 1
fi

echo "RBL check for ASN $ASN - Mode: $MODE - $DATE" > "$OUTPUT_FILE"
echo "=====================================" >> "$OUTPUT_FILE"

if [[ "$MODE" == "sample" ]]; then
  for PREFIX in $PREFIXES; do
    # Ambil IP pertama dari subnet
    IP=$(echo $PREFIX | cut -d/ -f1 | awk -F. '{print $1"."$2"."$3".1"}')
    check_ip "$IP"
  done
else
  for PREFIX in $PREFIXES; do
    echo "Expanding $PREFIX..."
    NET=$(echo $PREFIX | cut -d/ -f1)
    MASK=$(echo $PREFIX | cut -d/ -f2)

    if [[ "$MASK" -eq 24 ]]; then
      for i in {1..254}; do
        IP=$(echo $NET | awk -F. -v i=$i '{print $1"."$2"."$3"."i}')
        check_ip "$IP"
      done
    else
      # untuk prefix besar (misal /16, /8) jangan di-expand, terlalu berat
      IP=$(echo $NET | awk -F. '{print $1"."$2"."$3".1"}')
      check_ip "$IP"
    fi
  done
fi

echo -e "\nSelesai! Hasil tersimpan di $OUTPUT_FILE"
