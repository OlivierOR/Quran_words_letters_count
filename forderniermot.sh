for i in $(cat Qrn_numéros.txt)
 do
# S=$(echo $i | awk -F "|" '{print $1}')
# A=$(echo $i | awk -F "|" '{print $2}')
((a=a+1))
 aa="awk 'NR==$a {print;exit}' Dernier_mot_quran.txt"
 x=$(eval $aa)
str=$x
l=$(echo "${str: -1}")
if [ "$l" == "ا" ] || [ "$l" == "أ" ] || [ "$l" == "إ" ] || [ "$l" == "آ" ]; then
   ALIF=1; else ALIF=0; fi
   if [ "$l" == "ء" ]; then HAMZA=1; else HAMZA=0; fi
   if [ "$l" == "ب" ]; then BA=1; else BA=0; fi
   if [ "$l" == "ج" ]; then JIM=1; else JIM=0; fi
   if [ "$l" == "د" ]; then DAL=1; else DAL=0; fi
   if [ "$l" == "ه" ]; then HA=1; else HA=0; fi
 #  if [ "$l" == "و" ] || [ "$l" == "ؤ" ]; then WAW=1; else WAW=0; fi
   if [ "$l" == "ز" ]; then ZAY=1; else ZAY=0; fi
   if [ "$l" == "ح" ]; then HHA=1; else HHA=0; fi
   if [ "$l" == "ط" ]; then TAA=1; else TAA=0; fi 
   if [ "$l" == "ي" ]; then YA=1 ;else YA=0; fi
   if [ "$l" == "ك" ]; then KAF=1; else KAF=0; fi
   if [ "$l" == "ل" ]; then LAM=1; else LAM=0; fi
   if [ "$l" == "م" ]; then MIM=1; else MIM=0; fi
   if [ "$l" == "ن" ]; then NUN=1; else NUN=0; fi
   if [ "$l" == "س" ]; then SIN=1; else SIN=0; fi
   if [ "$l" == "ع" ]; then AYN=1; else AYN=0; fi
   if [ "$l" == "ف" ]; then FA=1; else FA=0; fi
   if [ "$l" == "ص" ]; then SAD=1; else SAD=0; fi
   if [ "$l" == "ق" ]; then QAF=1; else QAF=0; fi
   if [ "$l" == "ر" ]; then RA=1; else RA=0; fi
   if [ "$l" == "ش" ]; then SHIN=1; else SHIN=0; fi
   if [ "$l" == "ت" ]; then TA=1; else TA=0; fi
   if [ "$l" == "ث" ]; then THA=1; else THA=0; fi 
 #  if [ "$l" == "خ" ]; then KHA=1; else KHA=0; fi
   if [ "$l" == "ذ" ]; then DHAL=1; else DHAL=0; fi
   if [ "$l" == "ض" ]; then DAD=1; else DAD=0; fi
   if [ "$l" == "ظ" ]; then ZA=1; else ZA=0; fi
#   if [ "$l" == "غ" ]; then RHAYN=1; else RHAYN=0; fi
   if [ "$l" == "ة" ]; then TA_MARBUTA=1; else TA_MARBUTA=0; fi
   if [ "$l" == "ى" ]; then ALIF_MAQSURA=1; else ALIF_MAQSURA=0; fi
 printf "$i|$a|$ALIF|$BA|$TA|$THA|$JIM|$HHA|$DAL|$DHAL|\
$RA|$ZAY|$SIN|$SHIN|$SAD|$DAD|$TAA|$ZA|$AYN|$HAMZA|$FA|$QAF|\
$KAF|$LAM|$MIM|$NUN|$HA|$YA|$TA_MARBUTA|$ALIF_MAQSURA|$l|$x\n"
 printf "$i|$a|$ALIF|$BA|$TA|$THA|$JIM|$HHA|$DAL|$DHAL|\
$RA|$ZAY|$SIN|$SHIN|$SAD|$DAD|$TAA|$ZA|$AYN|$HAMZA|$FA|$QAF|\
$KAF|$LAM|$MIM|$NUN|$HA|$YA|$TA_MARBUTA|$ALIF_MAQSURA|$l|$x\n">>out.txt
done
