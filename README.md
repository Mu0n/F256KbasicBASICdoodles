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


Generates the well-known Mandelbrot fractal using all 320x240 pixels and 40 colors as per the `maxiter` variable. This algorithm uses superbasic floats (varnam#) and is of course, quite slow. For some reason, it breaks at a random spot on my machine, complaining about a perfectly working line of my fractal algorithm loop. I can return to the exact line again by tweaking my loop indices and it'll work no problem on that new pass. I'm hoping other people can run the same piece of code and report if they have the same intermittent problem.

### Files that are expected in the same directory:

* `mandel.bas`

