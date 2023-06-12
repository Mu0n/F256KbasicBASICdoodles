5     backcolor=0:x=100:y=100:sframe=0:maxframe=11:maxcolor=16
10    initstuff()
20    while true 
30    checkjoy()
40    checktime()
50    checkpos()
60    sprite 0 to x,y image sframe
70    wend 
500   proc initstuff()
510   sprites on :bitmap on :cls :bitmap clear 0
520   bload "valkyre.bspr",$30000
530   endproc 
1000  proc checkjoy()
1010  if joyb(0)&1
1020  x=x-5+random(11):y=y-5+random(11)
1030  sframe=sframe+1
1040  if sframe>maxframe then sframe=0:bitmap clear backcolor
1045  dodelay():endif 
1050  endif 
1060  x=x+joyx(0):y=y+joyy(0)
1070  endproc 
2000  proc checktime()
2010  backcolor=backcolor+1
2020  if backcolor>maxcolor then backcolor=0
2100  endproc 
3000  proc checkpos()
3010  if x<16 then x=16
3020  if x>303 then x=303
3030  if y<16 then y=16
3040  if y>223 then y=223
3050  endproc 
4000  proc dodelay()
4010  for i=0 to 500:next 
4020  endproc 
