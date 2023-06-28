2     cls 
3     bitmap on :bitmap clear 0
11    for j=0 to 239
12    for i=0 to 319
50    dopixel(i,j)
100   plot color iter to i,j
101   next 
102   next 
110   end 
199   proc dopixel(px,py)
200   x0#=-2.0+px/320.0*3.0
300   y0#=-1.0+py/240.0*2.0
302   cls 
303   print "x:";px;" y:";py
305   quitloop=0
400   x#=0.0:x2#=0.0
500   y#=0.0:y2#=0.0
600   iter=0
700   maxiter=40
705   result#=0.0
706   xtemp#=0.0
800   repeat 
840   x2#=x#*x#:y2#=y#*y#
900   result#=x2#+y2#
905   if result#>4.0 then quitloop=1
908   if quitloop=1 then goto 5005
1500  xtemp#=x2#-y2#+x0#
1600  y#=2*x#*y#+y0#
1700  x#=xtemp#
1800  iter=iter+1
1850  if iter>maxiter then quitloop=1
5005  rem 
5010  until quitloop=1
5015  rem 
5020  endproc 
9000  proc gocrazy()
9100  for c=0 to 10:palette c,random(255),random(255),random(255):next 
9200  for d=0 to 5000:next 
9300  goto 9100
9500  endproc
