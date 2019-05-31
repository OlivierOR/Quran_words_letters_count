ISO2=0
FIN=0
#echo $V
#echo $Num >> qrnmot.txt
#echo $ligne

#echo $i >> qrnmot.txt
read i
VAL_MOT="0"
  for l in $(grep -o . <<<$i)
   do 
   if [ "$l" == "ا" ] || [ "$l" == "أ" ] || [ "$l" == "إ" ] || [ "$l" == "آ" ] || [ "$l" == "ء" ]; then
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
#printf " |$l|$ISO| \n"
LETTRE_ET_VALEUR="${ISO};${l};${LETTRE_ET_VALEUR}"
ISO2=$(($ISO2+ISO))
VAL_LET=$(($ISO+0))
#echo $VAL_LET
VAL_MOT=$(($VAL_MOT+$VAL_LET))

echo "La lettre $l a pour valeur $ISO"

ISO="0"

done

echo "Le mot $i a pour valeur $ISO2"
