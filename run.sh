#!/bin/sh
# Thanks to KenT for contributions

RET=0
SOUND=$(zenity --list --width=350 --height=250 --radiolist \
  --title="Choose the Audio Output" \
  --column "Select" --column="Output" TRUE "Leave as is" FALSE "Auto" FALSE "Force Headphones" FALSE "Force HDMI"  )
RET=$?
echo $SOUND
if [ "$SOUND" = "Leave as is" ]; then
   echo "Leave as is"
elif [ "$SOUND" = "Auto" ]; then
   amixer -c 0 cset numid=3 0
   echo "Auto set"
elif [ "$SOUND" = "Force Headphones" ]; then
   amixer -c 0 cset numid=3 1
   echo "Headphones set"
elif [ "$SOUND" = "Force HDMI" ]; then
   amixer -c 0 cset numid=3 2
   echo "HDMI set"
else
   echo "cancel"
fi

while [ $RET -eq 0 ]; do
  GAME=$(zenity --width=350 --height=700 --list \
    --title="ArtSystem Launcher" \
    --text="Created By ArtGames101" \
    --column="Script name" --column="Description" \
    ArtSystem "Run ArtSystem" \
    Website   "The ArtSystem Website")  
  RET=$?
  echo $RET
  if [ "$RET" -eq 0 ]
  then
     if [ "$GAME" = "website" ]
     then
        sensible-browser "http://artsystem.webstarts.com"
     else
       if [ "$GAME" != "" ]; then
          x-terminal-emulator -t 'ArtSystem Aroba' -e python3 run.py
          exit
       fi
     fi
  fi
done