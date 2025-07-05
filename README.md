# F256KbasicBASICdoodles

**looking for examples in other languages?**

_Go check my repo for ASM doodles here:_ https://github.com/Mu0n/F256KsimpleASMdoodles

_Go check my repo for C doodles here:_ https://github.com/Mu0n/F256KsimpleCdoodles

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

## ShowPalette
![image](https://github.com/user-attachments/assets/c475b246-4ace-492b-a156-e035a67a0a51)

Shows all 256 colors of the default palette in a 10x10 block per color, 16x16 color grid

### Files that are expected in the same directory:

* `showpalette.bas`

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

## asmloop

![asmloop](https://github.com/user-attachments/assets/40beda68-bc36-4568-9e24-3c484f371b92)

Slightly more complicated inline assembly program that gets automatically called as soon as it finishes assembling. Writes a bunch of @ in the first line of text.

### Files that are expected in the same directory:

* `asmloop.bas`

## Fractal

![Screenshot 2023-07-25 15-46-32](https://github.com/Mu0n/F256KbasicBASICdoodles/assets/6774826/67a18fd0-62f8-4ca3-bc76-64d478797aab)

Generates the well-known Mandelbrot fractal using all 320x240 pixels and 40 colors as per the `maxiter` variable. This algorithm uses superbasic floats (varnam#) and is of course, quite slow. 

### Files that are expected in the same directory:

* `mandel.bas`

## Pulse Sound Generator Piano

![image](https://github.com/Mu0n/F256KbasicBASICdoodles/assets/6774826/a4f7c496-ef61-41d8-b55d-64e858848692)

v0.5 - Lets you do extremely simple tunes to make the Pulse Sound Generator play square waves. The notes die out after a few ticks if you let go of the keys, but you can sustain them longer by holding them down. XCVBNM,./QWERTYUIOP[] gives you white notes starting from the A 1 octave under the orchestral A (440Hz) and the characters 1 row above gives you the appropriate semi-tones (ie black notes). Press Escape to quit.

### Files that are expected in the same directory:

* `piano.bas`

## SAM2695 midi test

![image](https://github.com/user-attachments/assets/62033785-3a07-42c5-b023-9b77766ebf8f)

Detects your machine ID, lets you know if you have one that allows midi output with sam2695 (F256K2 and F256Jr2 in their classic cores), lets you carry on either way, and plays a C major scale with a small delay between notes.

### Files that are expected in the same directory:

* `sam.bas`


