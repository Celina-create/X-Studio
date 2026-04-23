#!/usr/bin/env bash
set -euo pipefail

REPOS=(
  "netease-youdao/LobsterAI"
  "qiuzhi2046/Qclaw"
  "QuantumClaw/QClaw"
  "ValueCell-ai/ClawX"
  "gaoyangz77/easyclaw"
  "ybgwon96/easyclaw"
)

OUT_DIR="$(cd "$(dirname "$0")" && pwd)/data"
mkdir -p "$OUT_DIR"
OUT_FILE="$OUT_DIR/emails.csv"
STARGAZERS_FILE="$OUT_DIR/all_stargazers.txt"

echo "repo,login,name,email,company,location,bio" > "$OUT_FILE"
: > "$STARGAZERS_FILE"

total_stargazers=0
for repo in "${REPOS[@]}"; do
  echo ">>> Fetching stargazers of $repo"
  page=1
  while :; do
    resp=$(gh api "repos/$repo/stargazers?per_page=100&page=$page" --jq '.[].login' 2>/dev/null || true)
    [ -z "$resp" ] && break
    while IFS= read -r login; do
      [ -z "$login" ] && continue
      echo "$repo,$login" >> "$STARGAZERS_FILE"
      total_stargazers=$((total_stargazers + 1))
    done <<< "$resp"
    count=$(echo "$resp" | wc -l | tr -d ' ')
    [ "$count" -lt 100 ] && break
    page=$((page + 1))
  done
done

echo ">>> Total stargazer records: $total_stargazers"
echo ">>> Deduplicating users..."
awk -F, '{print $2"\t"$1}' "$STARGAZERS_FILE" | sort -u -k1,1 > "$OUT_DIR/unique_users.tsv"
unique_count=$(wc -l < "$OUT_DIR/unique_users.tsv" | tr -d ' ')
echo ">>> Unique users: $unique_count"

echo ">>> Fetching user profiles..."
processed=0
found=0
while IFS=$'\t' read -r login repo; do
  processed=$((processed + 1))
  profile=$(gh api "users/$login" 2>/dev/null || echo '{}')
  email=$(echo "$profile" | jq -r '.email // empty')
  if [ -n "$email" ]; then
    name=$(echo "$profile" | jq -r '.name // empty' | tr -d ',\n\r')
    company=$(echo "$profile" | jq -r '.company // empty' | tr -d ',\n\r')
    location=$(echo "$profile" | jq -r '.location // empty' | tr -d ',\n\r')
    bio=$(echo "$profile" | jq -r '.bio // empty' | tr -d ',\n\r')
    echo "$repo,$login,$name,$email,$company,$location,$bio" >> "$OUT_FILE"
    found=$((found + 1))
  fi
  if [ $((processed % 50)) -eq 0 ]; then
    echo "    progress: $processed / $unique_count (emails: $found)"
  fi
done < "$OUT_DIR/unique_users.tsv"

echo ""
echo "=========================================="
echo "DONE. Processed: $processed, Emails found: $found"
echo "Output: $OUT_FILE"
echo "=========================================="
