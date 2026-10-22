#!/usr/bin/env bash
# Sobe arquivos para link público (o Instagram busca a mídia por URL). Uso: subir.sh arq1 [arq2...]  → imprime os links
# Depois de postado: subir.sh --limpar  (apaga tudo da pasta e do GitHub)
set -e; cd "$(dirname "$0")"; git pull -q
if [ "$1" = "--limpar" ]; then git rm -q --ignore-unmatch m/* && git commit -qm "limpa mídia postada" && git push -q; echo limpo; exit; fi
mkdir -p m; for f in "$@"; do n="$(date +%s)-$(basename "$f" | tr ' ' '-')"; cp "$f" "m/$n"; git add "m/$n"; L+=("https://raw.githubusercontent.com/JeanFelipe10/jztech-midia/master/m/$n"); done
git commit -qm "mídia para post" && git push -q; printf '%s\n' "${L[@]}"
