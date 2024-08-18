#!/bin/bash

# Obține ora și minutele curente
ora_curenta=$(date +"%H")
minute_curente=$(date +"%M")

# Calculăm câte minute au trecut din ora curentă
minute_trecute=$minute_curente
procentaj=$((minute_trecute * 100 / 60))

# Creăm bara de progres
lungime_bara=12
progres=$((lungime_bara * minute_trecute / 60))
bara=$(printf "%${progres}s" | sed 's/ /█/g')
bara=$(printf "%s%$(($lungime_bara - $progres))s" "$bara" | sed 's/ /░/g')

# Afișăm informațiile conform cerințelor
printf "HRS\t%02d:%02d %s %d%%\n" $ora_curenta $minute_curente "$bara" $procentaj
