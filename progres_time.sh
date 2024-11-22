#!/bin/bash

# Preia ora, minutele și secundele curente
ora_curenta=$(date +"%H")
minute_curente=$(date +"%M")
secunde_curente=$(date +"%S")

# Setăm lungimea barei de progres
lungime_bara=20

# Calculăm progresul pentru fiecare unitate
progres_ora=$((lungime_bara * ora_curenta / 24))
bara_ora=$(printf "%${progres_ora}s" | sed 's/ /█/g')
bara_ora=$(printf "%s%$(($lungime_bara - $progres_ora))s" "$bara_ora" | sed 's/ /░/g')

progres_minute=$((lungime_bara * minute_curente / 60))
bara_minute=$(printf "%${progres_minute}s" | sed 's/ /█/g')
bara_minute=$(printf "%s%$(($lungime_bara - $progres_minute))s" "$bara_minute" | sed 's/ /░/g')

progres_secunde=$((lungime_bara * secunde_curente / 60))
bara_secunde=$(printf "%${progres_secunde}s" | sed 's/ /█/g')
bara_secunde=$(printf "%s%$(($lungime_bara - $progres_secunde))s" "$bara_secunde" | sed 's/ /░/g')

# Afișăm rezultatele
printf "ORA    %02d  %s\n" $ora_curenta "$bara_ora"
printf "MINUTE %02d  %s\n" $minute_curente "$bara_minute"
printf "SECUNDE %02d  %s\n" $secunde_curente "$bara_secunde"
