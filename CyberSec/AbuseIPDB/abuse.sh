#!/bin/bash

API_KEY="xxx"  # Ganti dengan API Key Anda dari AbuseIPDB
OUTPUT_FILE="AbuseIPDB_$(date +%d-%m-%Y).txt"

# Mapping kategori Abuse
declare -A CATEGORY_MAP=(
  [3]="Fraud Orders"
  [4]="DDoS Attack"
  [5]="FTP Brute-Force"
  [9]="Spam"
  [10]="Open Proxy"
  [11]="Web Spam"
  [14]="Email Spam"
  [15]="Blog Spam"
  [18]="SSH Brute-Force"
  [19]="IoT Targeted"
  [21]="Phishing"
  [22]="Fraud VoIP"
  [23]="Open Relay"
  [25]="SQL Injection"
  [27]="Spoofing"
  [28]="Brute-Force (General)"
  [29]="Bad Web Bot"
  [30]="Exploited Host"
  [31]="Web App Attack"
  [32]="SSH Scan"
  [33]="VNC Brute-Force"
  [34]="SNMP Brute-Force"
  [35]="LDAP Brute-Force"
  [36]="IMAP Brute-Force"
  [37]="RDP Brute-Force"
  [38]="SIP Brute-Force"
  [39]="Web Exploit"
  [40]="SQL Brute-Force"
)

check_ip () {
  local IP=$1
  echo "Checking $IP..."

  DATA=$(curl -sG https://api.abuseipdb.com/api/v2/check \
    --data-urlencode "ipAddress=$IP" \
    --data-urlencode "maxAgeInDays=30" \
    --data-urlencode "verbose=true" \
    -H "Key: $API_KEY" \
    -H "Accept: application/json")

  SCORE=$(echo "$DATA" | jq -r '.data.abuseConfidenceScore')
  REPORTS=$(echo "$DATA" | jq -r '.data.totalReports')
  LAST=$(echo "$DATA" | jq -r '.data.lastReportedAt // "Never"')
  CATEGORIES=$(echo "$DATA" | jq -r '.data.reports[].categories[]?' 2>/dev/null | sort -u)

  CAT_TEXT=""
  for CID in $CATEGORIES; do
    if [[ -n "${CATEGORY_MAP[$CID]}" ]]; then
      CAT_TEXT+="${CATEGORY_MAP[$CID]}, "
    fi
  done
  CAT_TEXT=${CAT_TEXT%, } # hapus koma terakhir

  {
    echo "========================================"
    echo "IP Address      : $IP"
    echo "Score           : $SCORE"
    echo "Reports         : $REPORTS"
    echo "Last Reported   : $LAST"
    if [ -z "$CAT_TEXT" ]; then
      echo "Abuse Category  : Clean"
    else
      echo "$CAT_TEXT" | fold -s -w 80 | \
        sed '1s/^/Abuse Category  : /; 2,$s/^/                  /'
    fi
  } >> "$OUTPUT_FILE"
}


# Main
> "$OUTPUT_FILE"

if [ -z "$1" ]; then
  echo "Usage: $0 <IP_ADDRESS> | <file.txt>"
  exit 1
elif [ -f "$1" ]; then
  while read -r IP; do
    [ -n "$IP" ] && check_ip "$IP"
  done < "$1"
else
  check_ip "$1"
fi

echo "Hasil tersimpan di: $OUTPUT_FILE"
