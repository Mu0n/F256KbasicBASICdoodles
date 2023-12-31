1     rem "Simple piano app, play with Q to P for white notes and digits for blacks"2     rem "made by Mu0n on September 2, 2023 for the F256K by Foenix Retro Systems"5     nbelems=182:baad=$22C000:rem "baseaddr where we dump the data"6     nlen=50:rem "note length in terms of 70th of a sec"11    rem "nh: note height, nw: note width,vgap: black note height "12    rem "sy = start y"15    nh=40:nw=8:vgap=25:lcol=$00:sx=70:sy=16016    rem "Gaps for black notes. sg=small gap, mg=med gap, bg=big gap"17    sg=1:mg=2:bg=318    pb=sy+8:pw=sy+3530    rem "populate data"31    bitmap on :bitmap clear 233    bload "bullet.bspr",$3000034    cls 35    cleanthings()40    initthings()42    drawpiano()49    cls 100   scanloop()110   end 800   proc xpeek(addr)810   local block:block=addr\8192:local prevblock820   local offset:offset=addr%8192830   ?0=179:prevblock=?$E:?$E=block:?1=4840   peekvalue=?($C000+offset)850   ?1=0:?$E=prevblock860   endproc 900   proc xpoke(addr,value)910   local block:block=addr\8192:local prevblock920   local offset:offset=addr%8192930   ?0=179:prevblock=?$E:?$E=block:?1=4940   ?($C000+offset)=value950   ?1=0:?$E=prevblock960   endproc 1000  proc scanloop()1005  poke $D600,$9C:rem "forcing a middle volume level"1006  tim=timer()1008  text "Piano.bas v0.5 by Mu0n Dec31st 2023"dim 1 color $FF to 0,01009  text "You may play!"dim 1 color $FF to 160,201010  repeat 1019  rem "scanning from min keycode=44 to max=179"1020  for i=44 to 1791030  if keydown(i)1035  if i=146 then shutdown()1040  l=i:tim=timer():i=1801041  endif 1045  next 1145  if l<>0 then xpeek(baad+l):x=peekvalue1147  if x=0 then poke $D600,$9F1150  if x<>01151  xpeek(baad+$100+x):loval=peekvalue1152  xpeek(baad+$200+x):hival=peekvalue1153  xpeek(baad+$300+x):xbal=peekvalue1154  xpeek(baad+$400+x):ybal=peekvalue1155  poke $D600,$901160  poke $D600,loval:rem "low byte PSG channel 1 left"1170  poke $D600,hival:rem "hi byte PSG channel 1 left"1175  sprites on :sprite 0 to xbal+4,ybal image 01180  endif 1200  if timer()-tim>nlen then tim=timer():l=0:x=0:sprites off 1800  until false 1999  endproc 3000  proc drawpiano()3019  rect sx,sy solid color $FF to sx+21*nw,sy+nh3020  repeat 3022  note(sx+i*nw,sy):i=i+13040  until i=213042  doblacks()3090  endproc 4000  proc note(x,y)4010  line color lcol from x,y to x,y+nh to x+nw,y+nh to x+nw,y to x,y4090  endproc 4100  proc bnote(x,lg,rg):rem "lg=left gap rg=right gap"4110  rect sx+x-lg,sy solid color lcol to sx+x+rg,sy+vgap4190  endproc 4200  proc doblacks()4205  j=1:index=04210  repeat 4215  bnote(j*nw,sg,bg):j=j+2:rem "A#"4220  bnote(j*nw,bg,sg):j=j+1:rem "C#"4225  bnote(j*nw,sg,bg):j=j+2:rem "D#"4230  bnote(j*nw,bg,sg):j=j+1:rem "F#"4240  bnote(j*nw,mg,mg):j=j+1:rem "G#"4270  index=index+14280  until index=34290  endproc 4500  proc cleanthings()4501  print "Getting a RAM chunk clean.."4510  for y=0 to 2554520  xpoke(baad+y,0):xpoke(baad+$100+y,0):xpoke(baad+$200+y,0)4522  xpoke(baad+$300+y,0):xpoke(baad+$400+y,0)4550  next 4999  endproc 5000  proc initthings()5001  print "Loading Data.."5005  for y=0 to 355010  read a,b:xpoke(baad+a,b):rem "keycode index"5015  next 5020  for y=0 to 355025  read a,b:xpoke(baad+$100+a,b):rem "sfreq1"5030  next 5035  for y=0 to 355040  read a,b:xpoke(baad+$200+a,b):rem "sfreq2"5045  next 5050  for y=0 to 355055  read a,b:xpoke(baad+$300+a,b):rem "noteposx"5060  next 5065  for y=0 to 355070  read a,b:xpoke(baad+$400+a,b):rem "noteposy"5075  next 5100  endproc 5500  proc shutdown()5505  sound off 5510  print "Thanks for playing!"5515  bitmap clear 05516  poke $D600,$9F5520  end 5530  endproc 5600  proc xpoke(addr,value)5610  local block:block=addr\8192:local prevblock5620  local offset:offset=addr%81925630  ?0=179:prevblock=?$E:?$E=block:?1=45640  ?($C000+offset)=value5650  ?1=0:?$E=prevblock5660  endproc 5700  proc xpeek(addr)5710  local block:block=addr\8192:local prevblock5720  local offset:offset=addr%81925730  ?0=179:prevblock=?$E:?$E=block:?1=45740  peekvalue=?($C000+offset)5750  ?1=0:?$E=prevblock5760  endproc 5900  rem "keycodes for first row of white notes typed with z-/"5901  rem "written in pairs of keyboard_code,index"5910  data 120,3,99,5,118,6,98,8,110,10,109,11,44,13,46,15,47,175920  rem "keycodes for first row of black notes typed with S-;"5930  data 100,4,103,7,104,9,107,12,108,14,59,165940  rem "keycodes for second row of white notes typed with Q-]"5950  data 113,18,119,20,101,22,114,23,116,25,121,27,117,29,105,30,111,325955  data 112,34,91,35,93,375960  rem "keycodes for second row of black notes typed with 2-CLR"5970  data 50,19,51,21,53,24,54,26,55,28,57,31,48,33,61,36,179,386010  rem "LoByte command for first row of whites Z-/"6011  rem "written in pairs of index,command_byte"6012  data 3,$89,5,$8A,6,$87,8,$8A,10,$87,11,$81,13,$8B,15,$8C,17,$856020  rem "LoByte command for first row of blacks S-;"6022  data 4,$80,7,$87,9,$8F,12,$8D,14,$8B,16,$806030  rem "LoByte command for second row of whites Q-]"6032  data 18,$8C,20,$8D,22,$83,23,$80,25,$8D,27,$8E,29,$82,30,$86,32,$8E6034  data 34,$8A,35,$80,37,$8F6040  rem "LoByte command for second row of blacks 2-CLR"6042  data 19,$84,21,$88,24,$8E,26,$8D,28,$80,31,$8A,33,$84,36,$87,38,$877014  rem "HiByte command for first row of whites Z-/"7016  data 3,$3F,5,$38,6,$35,8,$2F,10,$2A,11,$28,13,$23,15,$1F,17,$1C7024  rem "HiByte command for first row of blacks S-;"7026  data 4,$3C,7,$32,9,$2C,12,$25,14,$21,16,$1E7035  rem "HiByte command for second row of whites Q-]"7036  data 18,$1A,20,$17,22,$15,23,$14,25,$11,27,$0F,29,$0E,30,$0D,32,$0B7037  data 34,$0A,35,$0A,37,$087045  rem "HiByte command for second row of blacks 2-CLR"7047  data 19,$19,21,$16,24,$12,26,$10,28,$0F,31,$0C,33,$0B,36,$09,38,$087050  rem "pair of symbol for note playing, index,x"7051  data 3,70,5,78,6,86,8,94,10,102,11,110,13,118,15,126,17,1347052  data 4,74,7,90,9,98,12,114,14,122,16,1307053  data 18,142,20,150,22,158,23,166,25,174,27,182,29,190,30,198,32,2067054  data 34,214,35,222,37,2307055  data 19,146,21,154,24,170,26,178,28,186,31,202,33,210,36,226,38,2347060  rem " pair of symbol for note playing, index,y"7061  data 3,pw,5,pw,6,pw,8,pw,10,pw,11,pw,13,pw,15,pw,17,pw7062  data 4,pb,7,pb,9,pb,12,pb,14,pb,16,pb7063  data 18,pw,20,pw,22,pw,23,pw,25,pw,27,pw,29,pw,30,pw,32,pw7064  data 34,pw,35,pw,37,pw7065  data 19,pb,21,pb,24,pb,26,pb,28,pb,31,pb,33,pb,36,pb,38,pb