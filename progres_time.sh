#!/bin/bash

# Preia ora, minutele și secundele curente
ora_curenta=$(date +"%H")
minute_curente=$(date +"%M")
secunde_curente=$(date +"%S")

# Conversii pentru a preveni probleme cu numere octale
ora_curenta=$((10#$ora_curenta))
minute_curente=$((10#$minute_curente))
secunde_curente=$((10#$secunde_curente))

# Setăm lungimea barei de progres
lungime_bara=20

# Calculăm progresul pentru fiecare unitate
progres_ora=$((lungime_bara * ora_curenta / 24))
progres_minute=$((lungime_bara * minute_curente / 60))
progres_secunde=$((lungime_bara * secunde_curente / 60))

# Construim barele
bara_ora=$(printf "%*s" $progres_ora "" | sed 's/ /█/g')
bara_ora=$(printf "%s%*s" "$bara_ora" $((lungime_bara - progres_ora)) "" | sed 's/ /░/g')

bara_minute=$(printf "%*s" $progres_minute "" | sed 's/ /█/g')
bara_minute=$(printf "%s%*s" "$bara_minute" $((lungime_bara - progres_minute)) "" | sed 's/ /░/g')

bara_secunde=$(printf "%*s" $progres_secunde "" | sed 's/ /█/g')
bara_secunde=$(printf "%s%*s" "$bara_secunde" $((lungime_bara - progres_secunde)) "" | sed 's/ /░/g')

# Afișăm rezultatele
printf "ORA    %02d  %s\n" $ora_curenta "$bara_ora"
printf "MINUTE %02d  %s\n" $minute_curente "$bara_minute"
printf "SECUNDE %02d  %s\n" $secunde_curente "$bara_secunde"
