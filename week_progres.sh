#!/bin/bash

# Constante
lungime_bara=12
zile_in_saptamana=7
zile_in_an=365

# Calculăm data curentă
timp_curent_secunde=$(date +%s)
inceput_an_secunde=$(date -d "01/01/2024 00:00:00" +%s) # Înlocuiește cu anul curent
timp_curent_zi=$(( (timp_curent_secunde - inceput_an_secunde) / 86400 ))

# Calculăm numărul săptămânii curente și ziua curentă din săptămână
numar_saptamana=$((timp_curent_zi / zile_in_saptamana + 1))
zi_saptamana=$((timp_curent_zi % zile_in_saptamana))

# Calculăm progresul în cadrul săptămânii
progres_saptamana=$((lungime_bara * zi_saptamana / zile_in_saptamana))
bara_saptamana=$(printf "%${progres_saptamana}s" | sed 's/ /█/g')
bara_saptamana=$(printf "%s%$(($lungime_bara - $progres_saptamana))s" "$bara_saptamana" | sed 's/ /░/g')

# Calculăm procentul complet
procentaj_saptamana=$((zi_saptamana * 100 / zile_in_saptamana))

# Afișăm informațiile
printf "WEEK\t%02d %s %d%%\n" $numar_saptamana "$bara_saptamana" $procentaj_saptamana
