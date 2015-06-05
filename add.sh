
day=10
month=3
year=2014
startep=276
let "n=310-276"
let "nextday=$day+$n*7"

echo > test.xml

for i in `seq 1 $n`;
do

let "startep+=1"
let "day+=7"

if [ $month == 1 ] || [ $month == 3 ] || [ $month == 5 ] || [ $month == 7 ] || [ $month == 8 ] || [ $month == 10 ] || [ $month == 12 ]
 then

  if [ $month == 8 ] && [  $day == 25 ]
	then
	let "day +=7"
  fi

  if [ $day -gt 31 ]; then 
    let "day -=31"
    let "month +=1"
  fi


fi

if [ $month -eq 4 ] || [ $month -eq 6 ] || [ $month -eq 9 ] || [ $month -eq 11 ]
  then
  if [ $day -gt 30 ] ; then  
    let "day -=30"
    let "month +=1"
  fi
fi
    
if [ $month == 2 ] ; then
  if [$day > 28 ] ; then  
    let "day -=28"
    let "month +=1"
  fi
fi


case $month in
1) monthtxt=Jan ;;
2) monthtxt=Feb ;;
3) monthtxt=Mar ;;
4) monthtxt=Apr ;;
5) monthtxt=May ;;
6) monthtxt=Jun ;;
7) monthtxt=Jul ;;
8) monthtxt=Aug ;;
9) monthtxt=Sep ;;
10) monthtxt=Oct ;;
11) monthtxt=Nov ;;
12) monthtxt=Dec ;;

esac


echo -e "\n$(cat test.xml)"> test.xml
echo -e " </item> \n$(cat test.xml)"> test.xml
echo -e "   <itunes:duration>60:00</itunes:duration> \n$(cat test.xml)"> test.xml
echo -e "   <pubDate>"$day" "$monthtxt" "$year" 20:00:00 +0000</pubDate> \n$(cat test.xml)"> test.xml
echo -e "   <guid>http://galexmusic.com/podcast/garethemerypodcast_"$startep".mp3</guid> \n$(cat test.xml)"> test.xml
echo -e "   <link>http://galexmusic.com/podcast/garethemerypodcast_"$startep".mp3</link> \n$(cat test.xml)"> test.xml
echo -e "   <description>#TGEP"$startep"\</description> \n$(cat test.xml)"> test.xml
echo -e "   <enclosure url=\"http://galexmusic.com/podcast/garethemerypodcast_"$startep".mp3\" type=\"audio/x-m4a\" /> \n$(cat test.xml)"> test.xml
echo -e "   <title>Gareth Emery Podcast "$startep"</title>\n$(cat test.xml)"> test.xml
echo -e " <item>\n$(cat test.xml)" > test.xml





done

