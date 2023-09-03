# F256KbasicBASICdoodles
A collection of small superbasic experiments for the F256K from Foenix Retro Systems

## Foenix Retro Systems
Website: https://c256foenix.com/

Foenix Retro Systems is a homebrew effort to bring 8/16/32-bit era processors in a new, reimagined retro series of computer designed by Stefany Allaire (https://twitter.com/StefanyAllaire)

## SuperBASIC 'basic doodles'
These simple examples in basic are my first steps into discovering the machine and its graphic, sound and input capabilities.

To run these, simply copy them over (probably using an SD card) and load them with `load 'program name.bas'` followed by `run`. When you're done, just hit `CTRL-C` to break execution from an infinite loop.

## BlinkBlue
![Blue LED blink](https://raw.githubusercontent.com/Mu0n/F256KbasicBASICdoodles/main/blinkblue/blink.gif)

Very simple code that toggles the Bit[2] (L0) from the Sys0 register (at $D6A0), which will make the SD card access blue LED blink

### Files that are expected in the same directory:

* `blink.bas`

## DancingValk
![Dancing Valk!](https://raw.githubusercontent.com/Mu0n/F256KbasicBASICdoodles/main/DancingValk/dancinvalk.gif))

Using a pre-compiled sprite object from Ernesto Contreras' demo project in basic, along with its default palette file

### Files that are expected in the same directory:

* `dance.bas`
* `default.pal`
* `valkyre.bspr`

### Controls
Use the joystick in port 2 to move around and dance (using the fire button) or control with the keyboard with 'Z' and 'X' for left and right and 'K' and 'M' for up and down and 'L' to dance (fire).

## Inlineasm
![Screenshot 2023-06-20 23-55-39](https://github.com/Mu0n/F256KbasicBASICdoodles/assets/6774826/a8fc4fec-fc5d-4949-856b-5e69dd85aa95)

An example usage of the `assemble` superbasic token that puts inline assembly instructions into a specific area of RAM.

### Files that are expected in the same directory:

* `inlineasm.bas`

## Fractal

![Screenshot 2023-07-25 15-46-32](https://github.com/Mu0n/F256KbasicBASICdoodles/assets/6774826/67a18fd0-62f8-4ca3-bc76-64d478797aab)

Generates the well-known Mandelbrot fractal using all 320x240 pixels and 40 colors as per the `maxiter` variable. This algorithm uses superbasic floats (varnam#) and is of course, quite slow. 

### Files that are expected in the same directory:

* `mandel.bas`

## Pulse Sound Generator Piano

![Snapshot - 127](https://github.com/Mu0n/F256KbasicBASICdoodles/assets/6774826/e0b0f2e9-54ed-4501-ba70-f08ade3a2d91)

Lets you do extremely simple tunes to make the Pulse Sound Generator play square waves. The notes die out after a few ticks if you let go of the keys, but you can sustain them longer by holding them down. QWERTYUIOP gives you white notes starting from the C right under the orchestral A (440Hz) and 23 567 90 gives you the appropriate semi-tones (ie black notes). Press Escape to quit.

### Files that are expected in the same directory:

* `sound01.bas`


