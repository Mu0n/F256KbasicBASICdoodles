1     '	"BASIC doodle from Mu0n, written in Feb2025"
2     '	"This is meant to show the status of the 4 NES pads"
10    print chr$(12)
300   while a=0
310   poke $D880,1:'"NES Control"
320   poke $D880,$81:'"Trigger NES read"
330   nesrd=peek($D880):nesrd=nesrd&$40
340   if nesrd<>$40:'"wait until it's done reading"
350   goto 330
360   endif 
370   pad0=peek($D884):pad1=peek($D886):pad2=peek($D888):pad3=peek($D88A)
380   print chr$(1),pad0," ",pad1," ",pad2," ",pad3,"    ";
500   wend 
510   end 
