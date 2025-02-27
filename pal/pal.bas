1     '	"BASIC doodle from Mu0n, written in Feb2025"
2     '	"This is meant to show the a few color look up tables"
5  delay=5000:i=0:x=7
8  bload"vga13h.pal",$30000
10    bitmap on :cls :bitmap clear 0
15    poke 1,1
20    for k=1 to 256
22      j=i>>2
30      poke $D000+i,(255-j*x)
32      poke $D000+i+1,(255-j*x)
34      poke $D000+i+2,(255-j*x)
36	    poke $D000+i+3,0
40      poke $D400+i,0
42      poke $D400+i+1,(255-j*x)
44      poke $D400+i+2,0
46	    poke $D400+i+3,0
79      i=i+4
80    next 
85 memcopy $30000,$400 to $D800
88 poke 1,0
90 for y=0 to 15
100 for x=0 to 15
200 for p=0 to 10
250 for q=0 to 10
300 plot color (x+16*y) to (80+x*10+p),(20+y*10+q)
700 next
800 next
900 next
1000 next
1010  for i=0 to delay:next 
1020  poke $D100,3
1030  for i=0 to delay:next 
1040  poke $D100,5
1050  for i=0 to delay:next 
1060  poke $D100,7
1070  for i=0 to delay:next 
1080  poke $D100,1
1090  goto 1010
