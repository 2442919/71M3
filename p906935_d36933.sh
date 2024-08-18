#!/bin/bash

# Constante
lungime_bara=12
secunde_pe_grad=240 # Secunde pentru un grad

# Calculăm data curentă
timp_curent_secunde=$(date +%s)
inceput_an_secunde=$(date -d "01/01/2024 00:00:00" +%s) # Înlocuiește cu anul curent

# Calculăm câte secunde au trecut de la ultima revizie completă
timp_curent_secunde_din_revolutie=$(( (timp_curent_secunde - inceput_an_secunde) % (360 * secunde_pe_grad) ))

# Calculăm gradul curent și secunde scurse din gradul curent
grad_curent=$((timp_curent_secunde_din_revolutie / secunde_pe_grad))
secunde_in_grad=$((timp_curent_secunde_din_revolutie % secunde_pe_grad))

# Calculăm progresul în cadrul gradului
progres_grad=$((lungime_bara * secunde_in_grad / secunde_pe_grad))
bara_grad=$(printf "%${progres_grad}s" | sed 's/ /█/g')
bara_grad=$(printf "%s%$(($lungime_bara - $progres_grad))s" "$bara_grad" | sed 's/ /░/g')

# Calculăm procentul complet
procentaj_grad=$((secunde_in_grad * 100 / secunde_pe_grad))

# Afișăm informațiile
printf "Grad %03d %s %d%%\n" $grad_curent "$bara_grad" $procentaj_grad
