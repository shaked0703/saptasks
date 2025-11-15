et -euo pipefail

NAME="${1-}"
if [[ -z "${NAME}" ]]; then
  echo "Usage: $0 <NAME>" >&2
  exit 1
fi

now="$(date -Iseconds)"

sha="N/A"
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  sha="$(git rev-parse --short HEAD 2>/dev/null || echo 'N/A')"
fi

echo "Date: ${now}"
echo "Commit: ${sha}"
echo "Name: ${NAME}"
