#!/bin/bash

# Constante
lungime_bara=12
total_zile=365

# Calculăm data curentă
timp_curent_secunde=$(date +%s)
inceput_an_secunde=$(date -d "01/01/2024 00:00:00" +%s) # Înlocuiește cu anul curent
timp_curent_zile=$(( (timp_curent_secunde - inceput_an_secunde) / 86400 ))

# Calculăm progresul în zilele anului
progres_orbita=$((lungime_bara * timp_curent_zile / total_zile))
bara_orbita=$(printf "%${progres_orbita}s" | sed 's/ /█/g')
bara_orbita=$(printf "%s%$(($lungime_bara - $progres_orbita))s" "$bara_orbita" | sed 's/ /░/g')

# Calculăm procentul complet
procentaj_orbita=$((timp_curent_zile * 100 / total_zile))

# Afișăm informațiile
printf "ORBITA\t%03d %s %d%%\n" $timp_curent_zile "$bara_orbita" $procentaj_orbita
