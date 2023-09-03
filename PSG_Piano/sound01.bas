1     rem "Simple piano app, play with Q to P for white notes and digits for blacks"
2     rem "made by Mu0n on September 2, 2023 for the F256K by Foenix Retro Systems"
5     nbelems=60
6     nlen=5:rem "note length in terms of 70th of a sec"
10    dim kcodes(nbelems)
20    dim sfreq(nbelems)
25    dim sfreq2(nbelems)
30    rem "populate data"
35    cleanthings()
40    initthings()
49    cls 
50    print "ESC: quit, QWER...P: white notes, 23 567 90: black notes"
100   scanloop()
110   end 
1000  proc scanloop()
1005  poke $D600,$9C:rem "forcing a middle volume level"
1006  tim=timer()
1010  repeat 
1019  rem "scanning for the above 100 keycode range"
1020  for i=100 to 146
1030  if keydown(i)
1035  if i=146 then shutdown()
1040  l=i-100:tim=timer()
1041  endif 
1042  next 
1050  for i=48 to 59
1055  if keydown(i)
1056  l=i:tim=timer()
1057  endif 
1058  next 
1145  if l<>0 then x=kcodes(l)
1147  if x=0 then poke $D600,$9F
1150  if x<>0
1155  poke $D600,$9C
1160  poke $D600,sfreq(x):rem "low byte to PSG channel 1 left"
1170  poke $D600,sfreq2(x):rem "hi byte to PSG channel 2 left"
1180  endif 
1200  if timer()-tim>nlen then tim=timer():l=0:x=0
1800  until false 
1999  endproc 
4000  proc cleanthings()
4010  for y=0 to nbelems-1
4020  kcodes(nbelems)=0
4050  next 
4999  endproc 
5000  proc initthings()
5005  for y=0 to 16
5010  read a,b:kcodes(a)=b
5015  next 
5020  for y=0 to 16
5025  read a,b:sfreq(a)=b
5030  next 
5035  for y=0 to 16
5040  read a,b:sfreq2(a)=b
5045  next 
5100  endproc 
5500  proc shutdown()
5505  sound off 
5510  print "Thanks for playing!"
5520  end 
5530  endproc 
6000  data 13,1,19,3,1,5,14,6,16,8,21,10,17,12,5,13,11,15,12,17
6001  data 50,2,51,4,53,7,54,9,55,11,57,14,48,16
6050  data 1,$8A,3,$8C,5,$82,6,$8F,8,$8D
6060  data 10,$8E,12,$82,13,$85,15,$8E,17,$89
6061  data 2,$82,4,$87,7,$8E,9,$8D,11,$8F,14,$89,16,$83
6070  data 1,$1A,3,$17,5,$15,6,$13,8,$11
6080  data 10,$0F,12,$0E,13,$0D,15,$0B,17,$0A
6081  data 2,$19,4,$16,7,$12,9,$10,11,$0E,14,$0C,16,$0B
