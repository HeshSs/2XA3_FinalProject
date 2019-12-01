%include "simple_io.inc"

global asm_main
extern rperm

section .data
	array: dq 	1,2,3,4,5,6,7,8

	prompt1: db	"if you want to swap, enter a,b", 10, 0
	prompt2: db	"if you want to end, enter 0: ", 0
	msg1: db	"program done", 10, 0
	err1: db	"incorrect input, redo", 10, 0
	err2: db 	"Something went wrong", 10, 0

        top8: db      "  +------+", 0
        top7: db      "  +-----+ ", 0
        top6: db      "   +----+ ", 0  
        top5: db      "   +---+  ", 0   
        top4: db      "    +--+  ", 0    
        top3: db      "    +-+   ", 0     
        top2: db      "     ++   ", 0      

        middle8: db      "  +      +", 0
        middle7: db      "  +     + ", 0
        middle6: db      "   +    + ", 0  
        middle5: db      "   +   +  ", 0   
        middle4: db      "    +  +  ", 0    
        middle3: db      "    + +   ", 0     

        bottom8: db      "..+------+", 0
        bottom7: db      "..+-----+.", 0
        bottom6: db      "...+----+.", 0
        bottom5: db      "...+---+..", 0
        bottom4: db      "....+--+..", 0
        bottom3: db      "....+-+...", 0
        bottom2: db      ".....++...", 0
        bottom1: db      ".....+....", 0

	space10: db 	"          ",0
	space5: db 	"     ", 0
	space4: db	"    ", 0

section .bss

section .text

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Subroutines ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
display_lines:
	enter	0,0
	saveregs

	mov	rbx, qword 1

  line_loop:
	cmp	rbx, qword 9
	je	display_lines_end

	;;;;;; Add lines 1-5

	mov	rcx, array
	mov	r13, qword 1
	cmp     rbx, qword 5
	je	line5

	mov	rcx, array
	mov	r12, qword 1
	cmp     rbx, qword 6
	je	line6

	mov	rcx, array
	mov	r13, qword 1
	cmp     rbx, qword 7
	je	line7

	mov	rcx, array
	mov	r12, qword 1
	cmp     rbx, qword 8
	je	line8

line_back:
	call	print_nl
	inc	rbx
	jmp 	line_loop

line5:					;;;;; line5
	cmp	r13, qword 9
	je	line_back

	cmp	qword [rcx], qword 1
	je	L51
	cmp	qword [rcx], qword 2
	je	L52
	cmp	qword [rcx], qword 3
	je	L53
	cmp	qword [rcx], qword 4
	je	L54
	cmp	qword [rcx], qword 5
	je	L55
	cmp	qword [rcx], qword 6
	je	L56
	cmp	qword [rcx], qword 7
	je	L57
	cmp	qword [rcx], qword 8
	je	L58

L51:
	mov 	rax, space10
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line5
L52:
	mov 	rax, space10
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line5
L53:
	mov 	rax, space10
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line5
L54:
	mov 	rax, top4
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line5
L55:
	mov 	rax, middle5
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line5
L56:
	mov 	rax, middle6
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line5
L57:
	mov 	rax, middle7
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line5
L58:
	mov 	rax, middle8
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line5

line6:					;;;;; line6
	cmp	r12, qword 9
	je	line_back

	cmp	qword [rcx], qword 1
	je	L61
	cmp	qword [rcx], qword 2
	je	L62
	cmp	qword [rcx], qword 3
	je	L63
	cmp	qword [rcx], qword 4
	je	L64
	cmp	qword [rcx], qword 5
	je	L65
	cmp	qword [rcx], qword 6
	je	L66
	cmp	qword [rcx], qword 7
	je	L67
	cmp	qword [rcx], qword 8
	je	L68

L61:
	mov 	rax, space10
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line6
L62:
	mov 	rax, space10
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line6
L63:
	mov 	rax, top3
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line6
L64:
	mov 	rax, middle4
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line6
L65:
	mov 	rax, middle5
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line6
L66:
	mov 	rax, middle6
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line6
L67:
	mov 	rax, middle7
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line6
L68:
	mov 	rax, middle8
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line6

line7:					;;;;; line7
	cmp	r13, qword 9
	je	line_back

	cmp	qword [rcx], qword 1
	je	L71
	cmp	qword [rcx], qword 2
	je	L72
	cmp	qword [rcx], qword 3
	je	L73
	cmp	qword [rcx], qword 4
	je	L74
	cmp	qword [rcx], qword 5
	je	L75
	cmp	qword [rcx], qword 6
	je	L76
	cmp	qword [rcx], qword 7
	je	L77
	cmp	qword [rcx], qword 8
	je	L78

L71:
	mov 	rax, space10
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line7
L72:
	mov 	rax, top2
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line7
L73:
	mov 	rax, middle3
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line7
L74:
	mov 	rax, middle4
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line7
L75:
	mov 	rax, middle5
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line7
L76:
	mov 	rax, middle6
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line7
L77:
	mov 	rax, middle7
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line7
L78:
	mov 	rax, middle8
	call 	print_string
	add	rcx, 8
	inc	r13
	jmp	line7

line8:					;;;;; line8
	cmp	r12, qword 9
	je	display_lines_end

	cmp	qword [rcx], qword 1
	je	b1
	cmp	qword [rcx], qword 2
	je	b2
	cmp	qword [rcx], qword 3
	je	b3
	cmp	qword [rcx], qword 4
	je	b4
	cmp	qword [rcx], qword 5
	je	b5
	cmp	qword [rcx], qword 6
	je	b6
	cmp	qword [rcx], qword 7
	je	b7
	cmp	qword [rcx], qword 8
	je	b8

b1:
	mov 	rax, bottom1
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line8
b2:
	mov 	rax, bottom2
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line8
b3:
	mov 	rax, bottom3
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line8
b4:
	mov 	rax, bottom4
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line8
b5:
	mov 	rax, bottom5
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line8
b6:
	mov 	rax, bottom6
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line8
b7:
	mov 	rax, bottom7
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line8
b8:
	mov 	rax, bottom8
	call 	print_string
	add	rcx, 8
	inc	r12
	jmp	line8

display_lines_end:
	call 	print_nl

	restoregs
	leave
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Display numbers Subroutine ;;;;;;;;;;;;;;;;;;;;;;;
display_numbers:
	enter	0,0
	saveregs

	mov 	rcx, array
	
	mov	rax, space5
	call	print_string
	mov 	rax, qword [rcx]
	call	print_int
	mov	rax, space4
	call	print_string

	mov	rax, space5
	call	print_string
	mov 	rax, qword [rcx+8]
	call	print_int
	mov	rax, space4
	call	print_string

	mov	rax, space5
	call	print_string
	mov 	rax, qword [rcx+16]
	call	print_int
	mov	rax, space4
	call	print_string

	mov	rax, space5
	call	print_string
	mov 	rax, qword [rcx+24]
	call	print_int
	mov	rax, space4
	call	print_string

	mov	rax, space5
	call	print_string
	mov 	rax, qword [rcx+32]
	call	print_int
	mov	rax, space4
	call	print_string

	mov	rax, space5
	call	print_string
	mov 	rax, qword [rcx+40]
	call	print_int
	mov	rax, space4
	call	print_string

	mov	rax, space5
	call	print_string
	mov 	rax, qword [rcx+48]
	call	print_int
	mov	rax, space4
	call	print_string

	mov	rax, space5
	call	print_string
	mov 	rax, qword [rcx+56]
	call	print_int
	mov	rax, space4
	call	print_string

	call 	print_nl

	restoregs
	leave
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Display subroutine ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
display:
	enter	0,0
	saveregs

	call	display_lines

	call 	display_numbers

	restoregs
	leave
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Main program ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_main:	
	enter	0,0
	saveregs

	call	display

	mov	rdi, array     ;1st param for rperm
	mov	rsi, qword 8   ;2nd param for rperm

	call 	rperm		; now the array 'array' is randomly initialzed

	call	display

prompt:
	mov 	rax, prompt1
	call	print_string
	mov	rax, prompt2
	call	print_string

re_prompt:
	call 	read_char	;;Asks user for input (char) and saves it in al

	cmp	al, 10
	je	re_prompt

	cmp	al, '0'
	je	asm_main_end

	cmp 	al, '1'
	jb	error1
	cmp	al, '8'
	ja	error1
	mov	r12, 0
	mov	r12b, al		;Saves value of 1st array to be swapped
	sub 	r12b, '0' 
	
	call	read_char

	cmp	al, ','
	jne	error1

	call	read_char

	cmp 	al, '1'
	jb	error1
	cmp	al, '8'
	ja	error1
	mov	r13, 0
	mov	r13b, al
	sub 	r13b, '0'	;Saves value of 2nd array to be swapped
	
	mov     rbx, array
		;;find the item with value r12
  loop1:
	cmp	r12, [rbx]
	je	have_first
	add 	rbx, 8
	jmp	loop1

  have_first:
	mov	r14, rbx
	mov	rbx, array

		;; find the item with value r13
  loop2:
	cmp	r13, [rbx]
	je	have_second
	add 	rbx, 8
	jmp	loop2

  have_second:
	mov	r15, rbx
                   		;; r12 = 1st value to swap
                                ;; r13 = 2nd value to swap
          			;; r14 = address of 1st value to swap
                                ;; r15 = address of 2nd value to swap
	mov	[r14], r13
	mov	[r15], r12
	
	call	display

	jmp 	prompt
	
  error1:
	mov 	rax, err1
	call	print_string
	jmp	prompt

  error2:
        mov     rax, err2
        call    print_string
        jmp     prompt


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Main program exit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_main_end:
        mov     rax, msg1
        call    print_string
	
	restoregs
	leave
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
