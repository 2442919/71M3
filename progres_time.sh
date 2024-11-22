#!/bin/bash

# Preia ora, minutele și secundele curente
ora_curenta=$(date +"%H")
minute_curente=$(date +"%M")
secunde_curente=$(date +"%S")

# Asigură-te că sunt valori numerice valide
ora_curenta=${ora_curenta#0}         # Elimină zerourile de început
minute_curente=${minute_curente#0}   # Elimină zerourile de început
secunde_curente=${secunde_curente#0} # Elimină zerourile de început

# Setăm lungimea barei de progres
lungime_bara=20

# Calculează progresul
progres_ora=$((lungime_bara * ora_curenta / 24))
progres_minute=$((lungime_bara * minute_curente / 60))
progres_secunde=$((lungime_bara * secunde_curente / 60))

# Construiește barele de progres
bara_ora=$(printf "%-${lungime_bara}s" "$(printf "%${progres_ora}s" | tr ' ' '█')" | tr ' ' '░')
bara_minute=$(printf "%-${lungime_bara}s" "$(printf "%${progres_minute}s" | tr ' ' '█')" | tr ' ' '░')
bara_secunde=$(printf "%-${lungime_bara}s" "$(printf "%${progres_secunde}s" | tr ' ' '█')" | tr ' ' '░')

# Afișează rezultatele
printf "ORA    %02d  %s\n" $ora_curenta "$bara_ora"
printf "MINUTE %02d  %s\n" $minute_curente "$bara_minute"
printf "SECUNDE %02d  %s\n" $secunde_curente "$bara_secunde"
