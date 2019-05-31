cat $1 | while read ligne 
do
V=$(echo $ligne| awk -F "|" '{print $3}' |tr -d '\r')
Num=$(echo $ligne| awk -F "|" '{print $1"|"$2}')
for i in $(echo $V)
 do
 ((a=a+1))
((b=b+1))
# echo $i
  for l in $(grep -o . <<<$i)
   do
#   echo "$l"
   case "$l" in
"ٓ") MADDA_EN_CHEF=$(($MADDA_EN_CHEF+1)); D=$(($D+1)) ;;
"ً") FATHA_TANWIN=$(($FATHA_TANWIN+1)); VO=$(($VO+1)) ;;
"ٰ") ALIF_SOUSCRIT=$(($ALIF_SOUSCRIT+1)); D=$(($D+1)) ;;
"ّ") CHADDA=$(($CHADDA+1)); D=$(($D+1)) ;;
"ْ") SUKKUN=$(($SUKKUN+1)); D=$(($D+1)) ;;
"ُ") DAMMA=$(($DAMMA+1)); VO=$(($VO+1)) ;;
"ٌ") DAMMA_TANWIN=$(($DAMMA_TANWIN+1)); VO=$(($VO+1)) ;;
"َ") FATHA=$(($FATHA+1)); VO=$(($VO+1)); ;;
"ِ") KASRA=$(($KASRA+1)); VO=$(($VO+1)) ;;
"ٍ") KASRA_TANWIN=$(($KASRA_TANWIN+1)); VO=$(($VO+1)) ;;
"ا") ALIF=$(($ALIF+1)); C=$(($C+1)) ;;
"ٱ") ALIF_WASLA=$(($ALIF_WASLA+1)); C=$(($C+1)); ;;
"أ") ALIF_HAMZA=$(($ALIF_HAMZA+1)); C=$(($C+1));  ;;
"إ")ALIF_HAMZA_SOUSCRIT=$(($ALIF_HAMZA_SOUSCRIT+1)); C=$(($C+1));  ;;
"أ")ALIF_HAMZA_EN_CHEF=$(($ALIF_HAMZA_EN_CHEF+1)); C=$(($C+1));  ;;
"ب")BA=$(($BA+1)); C=$(($C+1));  ;;
"ج")JIM=$(($JIM+1)); C=$(($C+1));  ;;
"د")DAL=$(($DAL+1)); C=$(($C+1));  ;;
"ه")HA=$(($HA+1)); C=$(($C+1));  ;;
"و")WAW=$(($WAW+1)); C=$(($C+1));  ;;
"ؤ")WAW_HAMZA=$(($WAW_HAMZA+1)); C=$(($C+1));  ;;
"ۥ")PETIT_WAW=$(($PETIT_WAW+1)); D=$(($D+1));  ;;
"ز")ZAY=$(($ZAY+1)); C=$(($C+1));  ;;
"ح")HHA=$(($HHA+1)); C=$(($C+1));  ;;
"ط")TAA=$(($TAA+1)); C=$(($C+1));  ;;
"ي")YA=$(($YA+1)); C=$(($C+1));   ;;
"ۦ")PETIT_YA=$(($PETIT_YA+1)); D=$(($D+1));   ;;
"ئ")YA_HAMZA=$(($YA_HAMZA+1)); C=$(($C+1));  ;;
"ك")KAF=$(($KAF+1)); C=$(($C+1));  ;;
"ل")LAM=$(($LAM+1)); C=$(($C+1));  ;;
"م")MIM=$(($MIM+1)); C=$(($C+1));  ;;
"ۢ")PETIT_MIM=$(($PETIT_MIM+1)); D=$(($D+1));  ;;
"ۭ")PETIT_MIM_SOUSCRIT=$(($PETIT_MIM_SOUSCRIT+1)); D=$(($D+1));  ;;
"ن")NUN=$(($NUN+1)); C=$(($C+1));  ;;
"ۨ")PETIT_NUN_HAUT=$(($PETIT_NUN_HAUT+1)); D=$(($D+1));  ;;
"س")SIN=$(($SIN+1)); C=$(($C+1));  ;;
"ۣ")PETIT_SIN_BAT=$(($PETIT_SIN_BAT+1)); D=$(($D+1));  ;;
"ۜ")PETIT_SIN_HAUT=$(($PETIT_SIN_HAUT+1)); D=$(($D+1));  ;;
"ع")AYN=$(($AYN+1)); C=$(($C+1));  ;;
"ف")FA=$(($FA+1)); C=$(($C+1));  ;;
"ص")SAD=$(($SAD+1)); C=$(($C+1));  ;;
"ق")QAF=$(($QAF+1)); C=$(($C+1));  ;;
"ر")RA=$(($RA+1)); C=$(($C+1));  ;;
"ش")SHIN=$(($SHIN+1)); C=$(($C+1));  ;;
 "ت")TA=$(($TA+1)); C=$(($C+1));  ;;
"ث")THA=$(($THA+1)); C=$(($C+1));  ;;
"خ")KHA=$(($KHA+1)); C=$(($C+1));  ;;
"ذ")DHAL=$(($DHAL+1)); C=$(($C+1));  ;;
"ض")DAD=$(($DAD+1)); C=$(($C+1));  ;;
"ظ")ZA=$(($ZA+1)); C=$(($C+1));  ;;
"غ")RHAYN=$(($RHAYN+1)); C=$(($C+1));  ;;
"ة")TA_MARBUTA=$(($TA_MARBUTA+1)); C=$(($C+1));  ;;
"ى")ALIF_MAQSURA=$(($ALIF_MAQSURA+1)); C=$(($C+1));  ;;
"ء")HAMZA=$(($HAMZA+1)); C=$(($C+1));  ;;
"ٔ")HAMZA_AU_DESSUS=$(($HAMZA_AU_DESSUS+1)); D=$(($D+1));  ;;
"۟")ZERO=$(($ZERO+1)); D=$(($D+1)); ;;
"۠")ZERO_RECTANGLE=$(($ZERO_RECTANGLE+1)); D=$(($D+1)); ;;
"۪")PETIT_STOP=$(($PETIT_STOP+1)); D=$(($D+1)); ;;
"۫")PETIT_STOP_HAUT=$(($PETIT_STOP_HAUT+1)); D=$(($D+1)); ;;
"۬")PETIT_STOP_HAUT_REMPLI=$(($PETIT_STOP_HAUT_REMPLI+1)); D=$(($D+1)); ;;
"ـ") ((VAL=VAL-1)); ;;
*)echo "Espace $l"; ;;
   esac
#   echo "$l"
   VAL=$(($VAL+1))
  done
VALFIN=$(($C+$VO+$D))

if [ $VAL != $VALFIN ]; then echo "erreur"; fi

printf "$Num|$VAL|$a|$b|$C|$VO|$D|\
$FATHA_TANWIN|$MADDA_EN_CHEF|$ALIF_SOUSCRIT|$CHADDA|$SUKKUN|\
$DAMMA|$DAMMA_TANWIN|$FATHA|$KASRA|$KASRA_TANWIN|$ALIF|$ALIF_WASLA|\
$ALIF_HAMZA|$ALIF_HAMZA_SOUSCRIT|$ALIF_HAMZA_EN_CHEF|$BA|$JIM|\
$DAL|$HA|$WAW|$WAW_HAMZA|$PETIT_WAW|$ZAY|$HHA|$TAA|$YA|$PETIT_YA|\
$YA_HAMZA|$KAF|$LAM|$MIM|$PETIT_MIM|$PETIT_MIM_SOUSCRIT|$NUN|\
$PETIT_NUN_HAUT|$SIN|$PETIT_SIN_BAT|$PETIT_SIN_HAUT|$AYN|$FA|\
$SAD|$QAF|$RA|$SHIN|$TA|$THA|$KHA|$DHAL|$DAD|$ZA|$RHAYN|$TA_MARBUTA|\
$ALIF_MAQSURA|$HAMZA|$HAMZA_AU_DESSUS|$ZERO|$ZERO_RECTANGLE|$PETIT_STOP|\
$PETIT_STOP_HAUT|$PETIT_STOP_HAUT_REMPLI|$i\n"

FATHA_TANWIN="";MADDA_EN_CHEF="";ALIF_SOUSCRIT="";CHADDA="";SUKKUN="";
DAMMA="";DAMMA_TANWIN="";FATHA="";KASRA="";KASRA_TANWIN="";ALIF="";ALIF_WASLA="";
ALIF_HAMZA="";ALIF_HAMZA_SOUSCRIT="";ALIF_HAMZA_EN_CHEF="";BA="";JIM="";
DAL="";HA="";WAW="";WAW_HAMZA="";PETIT_WAW="";ZAY="";HHA="";TAA="";YA="";PETIT_YA="";
YA_HAMZA="";KAF="";LAM="";MIM="";PETIT_MIM="";PETIT_MIM_SOUSCRIT="";NUN="";
PETIT_NUN_HAUT="";SIN="";PETIT_SIN_BAT="";PETIT_SIN_HAUT="";AYN="";FA="";
SAD="";QAF="";RA="";SHIN="";TA="";THA="";KHA="";DHAL="";DAD="";ZA="";RHAYN="";TA_MARBUTA="";
ALIF_MAQSURA="";HAMZA="";HAMZA_AU_DESSUS="";ZERO="";ZERO_RECTANGLE="";PETIT_STOP="";
PETIT_STOP_HAUT="";PETIT_STOP_HAUT_REMPLI="";
D="0";VO="0";C="0";VAL="";VALFIN="0";
 done
b=""
done
