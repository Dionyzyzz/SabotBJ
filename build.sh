#!/bin/sh
# Builds index.html (standalone page) from sabot-blackjack.html (Claude artifact source).
# The artifact source has no <html>/<head>; the Claude viewer adds that skeleton at publish time.
set -e
cd "$(dirname "$0")"
{
  printf '%s\n' '<!doctype html>' '<html lang="fr">' '<head>' \
    '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">' \
    '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>' \
    '</head>' '<body>'
  cat sabot-blackjack.html
  printf '%s\n' '</body>' '</html>'
} > index.html
echo "index.html généré."
