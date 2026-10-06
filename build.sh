#!/bin/sh
# Builds index.html (standalone web page, solo mode) from sabot-blackjack.html (Claude artifact source).
# The artifact source has no <html>/<head>: its <title> and font <link> lines move into the head here.
set -e
cd "$(dirname "$0")"
SRC=sabot-blackjack.html
DESC="Blackjack contre la banque : sabot de 6 jeux, conseiller de stratégie de base et probabilités en direct."
ICON="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64'%3E%3Crect x='10' y='6' width='40' height='54' rx='6' fill='%23fbf8f1' stroke='%23c9a45c' stroke-width='3'/%3E%3Ctext x='30' y='44' font-size='30' text-anchor='middle' font-family='Georgia,serif' fill='%23b3172b'%3E%E2%99%A5%3C/text%3E%3C/svg%3E"
{
  printf '%s\n' '<!doctype html>' '<html lang="fr">' '<head>' \
    '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">' \
    "<meta name=\"description\" content=\"$DESC\">" \
    '<meta name="theme-color" content="#170e0c">' \
    '<meta property="og:title" content="Le Sabot Blackjack">' \
    "<meta property=\"og:description\" content=\"$DESC\">" \
    '<meta property="og:type" content="website">' \
    "<link rel=\"icon\" href=\"$ICON\">"
  grep -E '^<(title|link)[ >]' "$SRC"
  printf '%s\n' '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>' \
    '</head>' '<body>'
  grep -vE '^<(title|link)[ >]' "$SRC"
  printf '%s\n' '</body>' '</html>'
} > index.html
echo "index.html généré."
