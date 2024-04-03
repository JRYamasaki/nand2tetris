// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// keyboard input kept in 24576, @KBD

// Loading the beginning screen address into addr
@SCREEN
D=A
@addr
M=D

@8192 // the number of 16 width pixels we need to set, 256 * (512 / 16)
D=A
@0
M=D

@0 // the number of times we should iterate
D=M
@n
M=D

@i
M=0

(LOOP)
    @i
    D=M
    @n
    D=D-M
    @RESET
    D;JEQ // check if i < n

    @KBD
    D=M
    @EMPTY
    D;JEQ

(FILL)
    @addr
    A=M
    M=-1 // set row to be black
    @CONTINUE
    0;JMP
(EMPTY)
    @addr
    A=M
    M=0 // set row to be white
    @CONTINUE
    0;JMP
(CONTINUE)

    @i
    M=M+1 // increment i
    @1
    D=A
    @addr
    M=D+M // move to the next 16 set of pixels

    @LOOP
    0;JMP

(RESET)
    @i
    M=0
    @SCREEN
    D=A
    @addr
    M=D
    @LOOP
    0;JMP
