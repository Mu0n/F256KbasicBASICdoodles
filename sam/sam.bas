5 ' "BASIC doodle from Mu0n, written in Feb2025"
10 ' "This is meant to play a scale in C major using the"
15 ' "SAM2695 chip onboard a F256K2 or F256Jr2"
20 ' "You may skip the machine ID detection part"
97 '"------------------------"
98 '"--------Globals---------"
99 '"------------------------"
100 green=0:'"approves sendind data to sam2695"
197 '"------------------------"
198 '"----------Main----------"
199 '"------------------------"
200 print"--Testing the SAM2695 onboard MIDI Chip"
210 print"--Finding out if you have a compatible machine..."
220 hwdetect()
260 if green=0
270   input"Still want to carry on with the test? Y/N:",ans$
280   if (ans$="Y")^(ans$="y")
290      print"okay then."
300   else
310      print"kbye. tkx."
320      end
330   endif
340 else
350   print"Playing the C major scale on MIDI channel 0"
360 endif
397 '"------------------------"
398 '"-----Note Playing-------"
399 '"------------------------"
400 for i=0 to 7
410   read note
420   print note," ";
425   noteon(note)
430   delay()
435   noteoff(note)
450 next
480 end
497 '"------------------------"
498 '"---hardware detection---"
499 '"------------------------"
500 proc hwdetect()
510 mid=PEEK($D6A7)
515 mid=mid&$3F:'"keep only relevant bits"
518 print"Machine ID detected: ",mid
520 if mid=$02
530   print"F256Jr2 detected":green=1
540 else
550   if mid=$11
560     print"F256K2 detected":green=1
570   else
580     print"Possible incompatible machine detected"
590   endif
600 endif 
610 endproc
797 '"------------------------"
798 '"--------delay-----------"
799 '"------------------------"
800 proc delay()
810 for i=0 to 100:next
820 endproc
847 '"------------------------"
848 '"------Note On-----------"
849 '"------------------------"
850 proc noteon(n)
860 poke $DDA1,$90:poke $DDA1,n:poke $DDA1,$3F:'"chn,note,speed"
870 endproc
897 '"------------------------"
898 '"------Note Off----------"
899 '"------------------------"
900 proc noteoff(n)
910 poke $DDA1,$80:poke $DDA1,n:poke $DDA1,$3F:'"chn,note,speed"
920 endproc
1000 data $30,$32,$34,$35,$37,$39,$3B,$3C
