1 REM" quick procedure to load a simple 320x240 "
2 REM" bitmap file with an 8-bit palette"
3 REM" assuming a starting point inside Gimp "
4 REM" or any modern file editor, save as indexed" 
5 REM" palette with 255 colors"
6 REM" use Ernesto's superbasic F256 toolkit"
7 REM" and go to the 4- transmute area"
8 REM" load your .bmp file into it and receive "
9 REM" it converted as a palette in /palettes/ and "
10 REM" fbmp file in /bitmaps/"
11 REM" you are now ready to load the "
12 REM" image and display it."
13 REM"Thanks to EMWhite for the assist on this code"
20    cls:bitmap clear 0
22    rem replace your file name here
25    print"loading the bitmap..."
30    bload"z66.fbmp",$10000
35    print"loading the palette..."
40    bload"z66.pal",$7800
50    rem copy over the palette to the right CLUT area
60    ?1=1:for c=0 to 1023:?($D000+c)=?($7800+c):next :?1=0
70    cursor off:bitmap on:cls
80    end