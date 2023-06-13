10 REM blinks on and off the blue LED on the F256K 
20 poke $D6A0,209
30 gosub 100
40 poke $D6A0,211
60 gosub 100
100 for b=0 to 10000
110 next
120 return
