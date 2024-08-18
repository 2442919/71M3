#!/bin/bash
#STAGE I - STANDARD TIME -
hrs=$(date +%H) #Hours
hrs_cd=$((24 - $hrs)) #Hours.CountDown
min=$(date +%M) #Minutes
min_cd=$((60 - $min)) #Minutes.CountDown
sec=$(date +%S) #Seconds
sec_cd=$((60 - $sec)) #Seconds.CountDown
dom=$(date +%d) #DayOfMonth
dow=$(date +%w) #DayOfWeek
dow_cd=$((7 - $dow)) #DayOfWeek.CountDown
now=$(date +%U) #NumberOfWeek
now_cd=$((52 - $now)) #NumberOfWeek.CountDown
mon=$(date +%m) #NumberOfMonth
mon_cd=$((12 - $mon)) #NumberOfMonth.CountDown
doy=$(date +%j) #DayOfYear
doy_cd=$((365 - $doy)) #DayOfYear.CountDown
noy=$(date +%Y) #NumberOfYear
dim=$(($hrs * 60 + $min)) #DayInMinutes
dim_cd=$((1440 - $dim)) #DayInMinutes.CountDown
dis=$(($dim * 60 + $sec)) #DayInSeconds
dis_cd=$((86400 - $dis)) #DayInSeconds.CountDown
yih=$(($doy * 24 + $hrs)) #YearInHours
yih_cd=$((8766 - $yih)) #YearInHours.CountDown
yim=$(($doy * 1440 + $dim)) #YearInMinutes
yim_cd=$((525960 - $yim)) #YearInMinutes.Countdown
yis=$(($doy * 86400 + $dis)) #YearInSeconds
yis_cd=$((31557600 - $yis)) #YearInSeconds.CountDown
#Stage II - TIME IN DEGREE -
did=$(($dis / 240)) #DayInDegree
did_cd=$((360 - $did)) #DayInDegree.CountDown
hid=$(($min / 4)) #HourInDegree
hid_cd=$((15 - $hid)) #HoursInDegree.CountDown
#Stage III - SUMERIAN TIME SYSTEM -
diss=$(($dis / 2)) #DayInSumerianSeconds
diss_cd=$((43200 - $diss)) #DayInSumerianSeconds.CountDown
dism=$(( $dim / 2)) #DayInSumerianMinutes
dism_cd=$((720 -$dism)) #DayInSumerianMinutes.CountDown
sh=$(($hrs / 2)) #DayInSumerianHours
sh_cd=$((12 - $sh)) #DayInSumerianHours.CountDown
sm=$(($dism - $sh * 60)) #SumerianMinutes
sm_cd=$((60 - $sm)) #SumerianMinutes.CountDown
ss=$(($diss - $dism * 60)) #SumerianSeconds
ss_cd=$((60 - $ss)) #SumerianSeconds.CountDown
syih=$(($doy * 12 + $sh)) #SumerianYearInHours
syih_cd=$((4383 - $syih)) #SumerianYearInHours.CountDown
syim=$(($doy * 720 + $dism)) #SumerianYearInMinutes
syim_cd=$((262980 - $syim)) #SumerianYearInMinutes.CowntDown
syis=$(($doy * 43200 + $diss)) #SumerianYearInSeconds
syis_cd=$((15778800 - $syis)) #SumerianYearInSeconds.CountDown
#Stage IV - SUMERIAN TIME IN DEGREE -
revolution=$(($diss / 120)) #DayInDegree.MidNight00:00:00AsStartPoint
revolution_cd=$((360 - $revolution)) #Revolution.CountDown
syid=$(($syis / 120)) #SumerianYearInDegree
syid_cd=$((131490 - $syid)) #SumerianYearInDegree.CountDown
smon=$(($syid / 10800)) #SumerianYearInMonths.360hrsCicles.30degreesX12timesX30days=360hrsCicle
smon_cd=$((12 - $smon)) #SumerianYearInMonths.CountDown
shid=$(($sm / 2)) #SumerianHourInDegree
shid_cd=$((30 - $shid)) #SumerianHourInDegree.CountDown
#Stage V - OUTPUT -
Time="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s\n"
printf "$Time" "24hFORMAT" ":" "+$hrs:$min:$sec" ":" "-$hrs_cd:$min_cd:$sec_cd" "12hFORMAT" ":" "+$sh:$sm:$ss" ":" "-$sh_cd:$sm_cd:$ss_cd"
DayInHours="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s"
printf "$DayInHours" "DayInHours" ":" "+$hrs" ":" "-$hrs_cd" "DayInSumerianHours" ":" "+$sh" ":" "-$sh_cd"
DayInMinutes="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s"
printf "$DayInMinutes" "DayInMinutes" ":" "+$dim" ":" "-$dim_cd" "DayInSumerianMinutes" ":" "+$dism" ":" "-$dism_cd"
DayInSeconds="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s\n"
printf "$DayInSeconds" "DayInSeconds" ":" "+$dis" ":" "-$dis_cd" "DayInSumerianSeconds" ":" "+$diss" ":" "-$diss_cd"
YearInDays="\n%20s%2s%10s%2s%10s"
printf "$YearInDays" "YearInDays" ":" "+$doy" ":" "-$doy_cd"
YearInHours="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s"
printf "$YearInHours" "YearInHours" ":" "+$yih" ":" "-$yih_cd" "SumerianYearInHours" ":" "+$syih" ":" "-$syih_cd"
YearInMinutes="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s"
printf "$YearInMinutes" "YearInMinutes" ":" "+$yim" ":" "-$yim_cd" "SumerianYearInMinutes" ":" "+$syim" ":" "-$syim_cd"
YearInSeconds="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s\n"
printf "$YearInSeconds" "YearInSeconds" ":" "+$yis" ":" "-$yis_cd" "SumerianYearInSeconds" ":" "+$syis" ":" "-$syis_cd"
DayInDegree="\n%20s%2s%10s%2s%10s"
printf "$DayInDegree" "DayInDegree" ":" "+$did" ":" "-$did_cd"
HourInDegree="\n%20s%2s%10s%2s%10s\t\t%22s%3s%10s%2s%10s\n"
printf "$HourInDegree" "HourInDegree" ":" "+$hid" ":" "-$hid_cd" "SumerianHourInDegree" ":" "+$shid" ":" "-$shid_cd"
