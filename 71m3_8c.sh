#!/bin/bash 
#             XXII.IV.MMXXIII.BC DECEBAL.V.NISIPEANU.
#USAGE! Copy this file in: /etc/profile.d/ Directory.
hrs=$(date +%H) #hours.
min=$(date +%M) #minutes.
sec=$(date +%S) #seconds.
nas=$(date +%N) #nanoseconds.
dom=$(date +%d) #day of month.
dow=$(date +%w) #day of week.
won=$(date +%U) #no. of week.
won_left=`echo "scale=0; 52 - $won" | bc` #no. of weeks left.
mon=$(date +%m) #no. of month.
mon_left=`echo "scale=0; 12 - $mon" | bc` #no. of month left.
doy=$(date +%j) #day of year.
doy_left=`echo "scale=0; 365 - $doy" | bc` #days of year, left.
noy=$(date +%Y) #no. of year.
dim=`echo "scale=2; $hrs * 60 + $min" | bc` #day in minutes.
min_pass=`echo "scale=2; 1440 - $dim" | bc` #min left.
dis=`echo "scale=2; $dim * 60 + $sec" | bc` #day in seconds.
did=`echo "scale=2; $dis / 240" | bc` #day in degree.
yim=`echo "scale=2; $doy * 1440 + $dim" | bc` #year in minutes.
yis=`echo "scale=2; $doy * 86400 + $dis" | bc` #year in seconds.
yih=`echo "scale=2; $doy * 24 + $hrs" | bc` #year in hours.
sec_left=`echo "scale=0; 86400 - $dis" | bc` #seconds left.
#SUMERIAN==================================================================================================================================
diss=`echo "scale=0; $dis / 2" | bc` #day in sumerian sec.
dism=`echo "scale=0; $diss / 60" | bc` #day in sumerian sec.
dish=`echo "scale=0; $dism / 60" | bc` #day in sumerian hrs.
sm=`echo "scale=0; $dism - $dish * 60" | bc` #sumerian min.
ss=`echo "scale=0; $diss - $dism * 60" | bc` #sumerian sec.
sn=`echo "scale=0; $nas /2" | bc` #sumerian nano.
#==========================================================================================================================================
orbit=`echo "scale=0; 0.985626283368 * $doy" | bc` #Planet poz. on Orbit, in degree.
km_sec=`echo "scale=1; $dis * 0.463831018519 " |bc` #planet rev. in km/s
kmsec=`echo "scale=2; 40075 - $km_sec " | bc` #km left 
hrs_left=`echo "scale=0; 24 - $hrs" | bc` #hrs left
min_left=`echo "scale=0; 1440 - $dim" | bc` #min left
#==========================================================================================================================================
rad=`echo "scale=2; $did * 0.0174532925" | bc` #day in radians.
#==========================================================================================================================================
age_years=`echo " $noy - 1976" | bc` #my age in years 
age_hrs=`echo " 8766 * $age_years + $doy * 24 - 140 * 24 - 2" | bc` #my age in hours
age_days=`echo " $age_hrs / 24" | bc` #my age in days
age_minutes=`echo " $age_hrs * 60 + $min - 120" | bc` #my age in minutes
age_seconds=`echo " $age_minutes * 60 + $sec + 20" | bc` #my age in seconds
age_deg=`echo " $age_seconds / 240 + $did" | bc` #my age in degree
age_rad=`echo "scale=2; $age_deg / 57.2957795" | bc` #my age in radians
#==========================================================================================================================================
date_in_degree=`echo "scale=2; $noy * 131490 + $did" | bc` #date in degree
date_in_hrs=`echo "scale=2; $noy * 8766 + $yih" | bc` #date in hrs
date_in_min=`echo "scale=2; $date_in_hrs * 60 + $min" | bc` #date in min
date_in_sec=`echo "scale=2; $date_in_min * 60 + $sec" | bc` #date in sec
#==========================================================================================================================================
year_in_degree=`echo "scale=2; $doy * 360 + $did" | bc` #year in degree
rad_days_of_years=`echo "scale=2; 6.2831853 * $doy + $rad" | bc` #year in radians
rad_years=`echo "scale=2; $noy * 2294.93343082 + $rad_days_of_years" | bc` #date in radians
########################################################################################################################################### 
header="\n%26s%10s%20s" # Setup Print(f) header
format="\n%10s\n" # Setup Print(f) format
###########################################################################################################################################

printf "$header" "[D]$doy:[R]$did°:[T]$hrs:$min:$sec."
printf "[LifeTime]::$age_years.Years||$age_days.Days||$age_hrs.Hours&$min.Minutes"
#SetPasswd:
syspasswd=$doy$did$hrs$min$sec
#PrintOutput
echo " "
echo " "
read -p "Enter Password :  " inputpasswd
if [ "$inputpasswd" = "$syspasswd" ]; then
printf "$format" "Password [ ACCEPTED! ]"
sleep 1; clear; echo "[ The SHELL Is READY ]  [ YO HAVE THE CONTROL ]  [ Sys.Time: JD$doy:R$did° ]";
else
exit 1
fi
