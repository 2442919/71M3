#!/bin/bash

# Funcție pentru afișarea minutelor în sistemul sumerian
display_sumerian_minutes() {
  min=$(date +%M) # Minute curente
  sec=$(date +%S) # Secunde curente

  # Convertim minutele standard și secundele în format sumerian
  sumerian_minutes=$((min / 2))   # 1 sumerian minute = 2 standard minutes
  sumerian_seconds=$((sec / 2))   # 1 sumerian second = 2 standard seconds

  # Calculăm procentajul de trecere a minutului curent
  progress_in_minute=$((sec * 100 / 60)) # Procentul de trecere al minutului curent

  # Afișăm minutele și secundele sumeriene
  echo "SUMERIAN MINUTES: ${sumerian_minutes}:${sumerian_seconds}"

  # Afișăm bara de progres redusă la 20% din lungimea originală (20% din 100% = 20 caractere)
  bar_length=20
  filled_length=$((progress_in_minute * bar_length / 100))
  bar="▓"
  echo -ne "SMIN      ${min} ["
  for ((i=0; i<filled_length; i++)); do
    echo -ne "$bar"
  done
  for ((i=filled_length; i<bar_length; i++)); do
    echo -ne " "
  done
  echo -ne "] ${progress_in_minute}%\r"
  echo ""
}

# Apelăm funcția pentru a afișa minutele și secundele în format sumerian
display_sumerian_minutes
