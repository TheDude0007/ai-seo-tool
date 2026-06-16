#!/bin/bash
set -e
echo "→ Pushing to GitHub..."
git add -A
git commit -m "${1:-"Update"}" 2>/dev/null || echo "(nothing to commit)"
git push origin main
echo "→ Deploying to Vercel..."
cd "$(dirname "$0")/.."
vercel --prod --yes
echo "✓ Done — https://ai-seo-tool-liard.vercel.app"
