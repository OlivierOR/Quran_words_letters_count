>Qrn-verse.txt
>Qrn-word.txt
ISO2=0
FIN=0
#echo $V
cat $1 | while read ligne 
do
V=$(echo $ligne| awk -F "|" '{print $3}')
Num=$(echo $ligne| awk -F "|" '{print $1";"$2}')
printf $Num
printf $Num >> Qrn-verse.txt
#echo $Num >> qrnmot.txt
#echo $ligne
for i in $(echo $V)
 do
m=$((m+1))
pos=$m
#echo $i >> qrnmot.txt
VAL_MOT="0"
  for l in $(grep -o . <<<$i)
   do
#   echo "$l" |xxd -ps -c 200 
   if [ "$l" != $'\r' ]; then
   a=$((a+1)) 
   b=$((b+1)) 
   fi
   if [ "$l" == "ا" ] || [ "$l" == "أ" ] || [ "$l" == "إ" ] || [ "$l" == "آ" ] || [ "$l" == "ء" ] || [ "$l" == "ٱ" ] ; then
   ISO=$((ISO+1))
   elif [ "$l" == "ب" ]; then
   ISO=$((ISO+2))
   elif [ "$l" == "ج" ]; then
   ISO=$((ISO+3))
   elif [ "$l" == "د" ]; then
   ISO=$((ISO+4))
   elif [ "$l" == "ه" ] || [ "$l" == "ة" ]; then
   ISO=$((ISO+5))
   elif [ "$l" == "و" ] || [ "$l" == "ؤ" ]; then
   ISO=$((ISO+6))
   elif [ "$l" == "ز" ]; then
   ISO=$((ISO+7))
   elif [ "$l" == "ح" ]; then
   ISO=$((ISO+8))
   elif [ "$l" == "ط" ]; then
   ISO=$((ISO+9))
   elif [ "$l" == "ي" ] || [ "$l" == "ى" ] || [ "$l" == "ئ" ]; then
   ISO=$((ISO+10))
   elif [ "$l" == "ك" ]; then
   ISO=$((ISO+20))
   elif [ "$l" == "ل" ]; then
   ISO=$((ISO+30))
   elif [ "$l" == "م" ]; then
   ISO=$((ISO+40))
   elif [ "$l" == "ن" ]; then
   ISO=$((ISO+50))
   elif [ "$l" == "س" ]; then
   ISO=$((ISO+60))
   elif [ "$l" == "ع" ]; then
   ISO=$((ISO+70))
   elif [ "$l" == "ف" ]; then
   ISO=$((ISO+80))
   elif [ "$l" == "ص" ]; then
   ISO=$((ISO+90))
   elif [ "$l" == "ق" ]; then
   ISO=$((ISO+100))
   elif [ "$l" == "ر" ]; then
   ISO=$((ISO+200))
   elif [ "$l" == "ش" ]; then
   ISO=$((ISO+300))
   elif [ "$l" == "ت" ]; then
   ISO=$((ISO+400))
   elif [ "$l" == "ث" ]; then
   ISO=$((ISO+500))
   elif [ "$l" == "خ" ]; then
   ISO=$((ISO+600))
   elif [ "$l" == "ذ" ]; then
   ISO=$((ISO+700))
   elif [ "$l" == "ض" ]; then
   ISO=$((ISO+800))
   elif [ "$l" == "ظ" ]; then
   ISO=$((ISO+900))
   elif [ "$l" == "غ" ]; then
   ISO=$((ISO+1000))
   fi
if [ $ISO -eq 0 ] && [ "$l" == "0" ];then
echo "PROBLEM">>p.txt
echo "$l">>p.txt
fi
#printf " |$l|$ISO| \n"
LETTRE_ET_VALEUR="${ISO}-${LETTRE_ET_VALEUR}"
ISO2=$(($ISO2+ISO))
VAL_LET=$(($ISO+0))
#echo $VAL_LET
VAL_MOT=$(($VAL_MOT+$VAL_LET))
ISO="0"
done
#NBLET=$(printf $i|wc -c)
if [ $ISO -eq 0 ];then
printf "$Num;$pos;$a;$VAL_MOT;$LETTRE_ET_VALEUR;$i\n" >> Qrn-word.txt
else
printf "$Num;$pos;$a;$VAL_MOT;$LETTRE_ET_VALEUR|$i" >> Qrn-word.txt
fi

a=0

#echo $LETTRE_ET_VALEUR
LETTRE_ET_VALEUR=""
#echo $VAL_MOT >> qrnmot.txt
#VAL_MOT="0"
# echo $FIN
 done
printf ";$ISO2;$m;$b\n"
printf ";$ISO2;$m;$b\n" >> Qrn-verse.txt
ISO2="0"
b=0
m=0
pos=""
done
