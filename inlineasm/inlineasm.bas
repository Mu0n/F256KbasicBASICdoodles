10    cls :bitmap on :bitmap clear 4
20    assemble $6000,2
30    lda #$02
40    sta $0001
50    lda #$40
60    sta $C00F
70    rts 
80    a=0
90    repeat 
100   print peek($6000+a):a=a+1
110   until a=10
120   call $6000
130   print 
140   print "the lines 6000 to 6009 list the assembly code"
150   print "copied over starting at address $6000. all require 1 opcode byte"
160   print "and some require 0, 1 or 2 arguments."
170   print "for example, $A9 = decimal 169 = LDA (immediate) 1 arg"
180   print "2nd example, $8D = decimal 141 = STA (absolute) 2 arg"
190   print "the lines at the end starting with '169' check the bytes in deci form"
200   print "the asm code just puts a @ at line 1 column 16"
