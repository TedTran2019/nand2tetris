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
(LOOP)
  @SCREEN
  D = A
  @screen
  M = D

  @256
  D = A
  @y
  M = D

  @KBD
  D = M

  @YLOOP2
  D;JEQ

  (YLOOP)
    @32
    D = A
    @x
    M = D

    @y
    M = M - 1
    D = M
    @LOOP
    D;JLT

    (XLOOP)
      @screen
      A = M
      M = -1

      @screen
      M = M + 1

      @x
      M = M - 1
      D = M
      @XLOOP
      D;JGT

    @YLOOP
    0;JMP

  (YLOOP2)
    @32
    D = A
    @x
    M = D

    @y
    M = M - 1
    D = M
    @LOOP
    D;JLT

    (XLOOP2)
      @screen
      A = M
      M = 0

      @screen
      M = M + 1

      @x
      M = M - 1
      D = M
      @XLOOP2
      D;JGT

    @YLOOP2
    0;JMP