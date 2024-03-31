// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// You can add or subtract in hack
// Need a for loop, takes two numbers in the ram, use a for loop to multiply them together and store them in R2

// How do we add numbers?
// How do we store the result in the R2?
// How do we do this for two numbers?
    // How can we expand this function to do it for all numbers in the register?

// Set inputs for test
@0
D=A
@2
M=D

(LOOP)
    // jump to end if @1 or @0 is zero
    @1
    D=M
    @END
    D;JEQ

    @0
    D=M
    @END
    D;JEQ

    // load @0
    @0
    D=M

    // add @0 to sum
    @2
    M=D+M

    // subtract 1 from @1
    @1
    M=M-1

    @LOOP
    0;JMP
(END)
    @END
    0;JMP