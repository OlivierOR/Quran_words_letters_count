A few words.

First of all, thanks to Tanzil (http://tanzil.net/docs/download)
who provided the Quran versions used in this program.

Count words and letters of the surah, verses and words
of the Quran from his uthmani longuest version.

Get the abjad values of surah, verses and words also.

Look rimes of the Quran from the last word of each verses
and get for each lasts words their last letter.

Analyse it easily with a small sqlite3 database...


Documentation.

Prerequisite : Have bash and sqlite3 installed.

Usage : 

bash Cagoule.sh 

***

It will launch all the shells and will create the final
sqlite3 database. You can look the directory named "Exemple" which
contains the result of such a launch.

Be patient if you launch it, it takes a bit time...
Or you can go quickly use the exemple directory...

Up to you !

***

Usage of each shell script :

Count words and letters of the surah, verses and words

***

bash Quran_compte2.sh quran-uthmani_without_crlf.txt

Wait for it a bit... At the end of the process you get the results
in the file named QWLC.txt

In file Nomenclature.txt are the correspondance between arab characters
and their names.

***

Get the abjad values of surah, verses and words

***

bash Isoarabe-verset.sh quran-uthmani_without_crlf.txt

Wait a bit for it... At the end of the process, files 
Qrn-word.txt and Qrn-verse.txt 
are written with the results.

In file Nomenclature.txt are the correspondance between arab characters
and their names.

***

Look rimes of the Quran from the last word of each verses 
and get for each lasts words their last letter.

***

bash forderniermot.sh quran-uthmani-min.txt

Wait a bit for it... At the end of the process, file named
out.txt is written in which you can consult the results.

***

Analyse it easily with a small sqlite3 database

***

Launch this commmand :

bash Execute_cagoule.sh

This will create the sqlite3 database named QRN.db.

Warning :

It is a prerequisite that all shell scripts must have been launched 
before to create database

***

Usage of the database 

***

If you want to use it quickly you can to the 
Exemple directory and launch it with the command :

sqlite3 QRN.db

Exemples of sql queries and their explanation :

***

Count total words number of the Quran :
SELECT COUNT(MOT) FROM QRN_QWLC ;

Count numbers of words in the place that where revealed the surah :
SELECT PLACE, COUNT(MOT)  FROM QRN_SURAH_NAME, QRN_QWLC WHERE QRN_SURAH_NAME.S=QRN_QWLC.S GROUP BY PLACE

Which is the Surah that does not have any letter FA in her verses :
SELECT S,SUM(FA) FROM QRN_QWLC GROUP BY S HAVING SUM(FA)=0;

Count numbers of consomns for each verses :
SELECT S,A,SUM(C) FROM QRN_QWLC GROUP BY 1,2 ORDER BY 3;

Count number of words for each verses by surah in descending order :
SELECT S, A, COUNT(*) FROM QRN_QWLC  GROUP BY S, A ORDER BY 3 DESC;

Count numbers of each final consomn of the final word of each verse in all the Quran :
SELECT SUM(ALIF),SUM(BA),SUM(TA),SUM(THA),SUM(JIM),SUM(HHA),SUM(DAL),SUM(DHAL),
SUM(RA),SUM(ZAY),SUM(SIN),SUM(SHIN),SUM(SAD),SUM(DAD),SUM(TAA),SUM(ZA),SUM(AYN),
SUM(HAMZA),SUM(FA),SUM(QAF),SUM(KAF),SUM(LAM),SUM(MIM),SUM(NUN),SUM(HA),SUM(YA),
SUM(TA_MARBUTA),SUM(ALIF_MAQSURA) FROM QRN_LAST_WORD_LETTER_VERSE;

For exemple, 
we see that there are 949 verses in the Quran that finish with the ALIF letter...
This is also the ALIF letter that is the most used at last word of eachs verses...

***



I invite you to listen to Siboy, french artist rapper who is very funny 
and who make me named one of these files :) !

