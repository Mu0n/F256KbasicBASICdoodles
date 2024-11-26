10 bitmap on:cls:bitmap clear 0
90 for y=0 to 15
100 for x=0 to 15
200 for p=0 to 10
250 for q=0 to 10
300 plot color (x+16*y) to (80+x*10+p),(20+y*10+q)
700 next
800 next
900 next
1000 next
