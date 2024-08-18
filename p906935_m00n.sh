#!/bin/bash

# Constante
lungime_bara=12
zile_in_luna=30 # Aproximativ număr mediu de zile pe lună

# Calculăm data curentă
timp_curent_secunde=$(date +%s)
inceput_an_secunde=$(date -d "01/01/2024 00:00:00" +%s) # Înlocuiește cu anul curent
timp_curent_zi=$(( (timp_curent_secunde - inceput_an_secunde) / 86400 ))

# Calculăm luna curentă și ziua curentă din lună
numar_luna=$(( (timp_curent_zi / zile_in_luna) % 12 + 1 ))
zi_luna=$(( timp_curent_zi % zile_in_luna ))

# Calculăm numărul de zile în luna curentă
if [ $numar_luna -eq 2 ]; then
    zile_in_luna=28
elif [ $numar_luna -eq 4 ] || [ $numar_luna -eq 6 ] || [ $numar_luna -eq 9 ] || [ $numar_luna -eq 11 ]; then
    zile_in_luna=30
else
    zile_in_luna=31
fi

# Calculăm progresul în cadrul lunii
progres_luna=$((lungime_bara * zi_luna / zile_in_luna))
bara_luna=$(printf "%${progres_luna}s" | sed 's/ /█/g')
bara_luna=$(printf "%s%$(($lungime_bara - $progres_luna))s" "$bara_luna" | sed 's/ /░/g')

# Calculăm procentul complet
procentaj_luna=$((zi_luna * 100 / zile_in_luna))

# Afișăm informațiile
printf "LUNA %02d Z%02d %s %d%%\n" $numar_luna $((zi_luna + 1)) "$bara_luna" $procentaj_luna
