#!/bin/bash

# Constante
durata_revolutie=240       # secunde pentru 1 grad
grade_complet=360         # grade pentru o revoluție completă
secunde_revolutie_completa=$((durata_revolutie * grade_complet))  # Total secunde pentru o revoluție completă
lungime_bara=12

# Calculăm timpul curent în secunde de la începutul zilei
timp_curent_secunde=$(date +%s)
start_revolutie_secunde=$(date -d "00:00:00" +%s)  # Timpul în secunde de la miezul nopții
timp_revolutie_secunde=$((timp_curent_secunde - start_revolutie_secunde))

# Calculăm cât de mult din revoluție a trecut
grade_trecute=$((timp_revolutie_secunde / durata_revolutie))
grade_trecute=$((grade_trecute % grade_complet))  # Împiedicăm să depășim 360 de grade
progres=$((lungime_bara * grade_trecute / grade_complet))
bara=$(printf "%${progres}s" | sed 's/ /█/g')
bara=$(printf "%s%$(($lungime_bara - $progres))s" "$bara" | sed 's/ /░/g')

# Calculăm procentul complet
procentaj=$((grade_trecute * 100 / grade_complet))

# Afișăm informațiile conform cerințelor
printf "REV\t%03d %s %d%%\n" $grade_trecute "$bara" $procentaj
