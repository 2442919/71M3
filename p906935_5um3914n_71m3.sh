#!/bin/bash

# Funcție pentru afișarea orei în sistemul sumerian
display_sumerian_time() {
  hrs=$(date +%H) # Ora curentă în format 24h
  min=$(date +%M) # Minute curente
  sec=$(date +%S) # Secunde curente

  # Convertim ora standard în format sumerian
  sumerian_hours=$((hrs / 2)) # 1 sumerian hour = 2 standard hours
  sumerian_minutes=$((min / 2)) # 1 sumerian minute = 2 standard minutes
  sumerian_seconds=$((sec / 2)) # 1 sumerian second = 2 standard seconds

  # Calculăm procentajul de trecere a orei curente
  total_seconds_in_hour=$((3600)) # Total secunde într-o oră standard
  current_seconds=$((hrs * 3600 + min * 60 + sec)) # Secunde trecute de la începutul zilei
  progress=$((current_seconds % total_seconds_in_hour * 100 / total_seconds_in_hour))

  # Afișăm ora sumeriană
  echo "SUMERIAN TIME: ${sumerian_hours}:${sumerian_minutes}:${sumerian_seconds}"

  # Afișăm bara de progres redusă la 20% din lungimea originală (20% din 100% = 20 caractere)
  bar_length=20
  filled_length=$((progress * bar_length / 100))
  bar="▓"
  echo -ne "SHRS ["
  for ((i=0; i<filled_length; i++)); do
    echo -ne "$bar"
  done
  for ((i=filled_length; i<bar_length; i++)); do
    echo -ne " "
  done
  echo -ne "] ${progress}%\r"
  echo ""
}

# Apelăm funcția pentru a afișa timpul în format sumerian
display_sumerian_time
