// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.
	(LOOP)
		@SCREEN
		D=A
		@address
		M=D

		@i
		M=0

		@CHECKKBD
		0;JMP

		(CONTINUE)
			(INNERLOOP)
				@i
				D=M
				@8192
				D=A-D
				@LOOP
				D;JEQ

				@stat
				D=M

				@address
				A=M
				M=D

				@i
				M=M+1

				@address
				M=M+1

				@INNERLOOP
				0;JMP

		@LOOP
		0;JMP

	(CHECKKBD)
		@KBD
		D=A
		@stat
		A=D
		D=M

		@SETWHITE
		D;JEQ
		@SETBLACK
		D;JNE

		(SETWHITE)
			@stat
			M=0
			@CONTINUE
			0;JMP
		(SETBLACK)
			@stat
			M=-1
			@CONTINUE
			0;JMP
