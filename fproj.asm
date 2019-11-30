%include "simple_io.inc"

global asm_main
extern rperm

section .data
	array: dq 	1,2,3,4,5,6,7,8

	prompt1: db	"if you want to swap, enter a,b", 10, 0
	prompt2: db	"if you want to end, enter 0: ", 0
	err1: db	"incorrect input, redo", 10, 0
	err2: db 	"2nd character must be ','", 10, 0

section .bss

section .text

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Subroutines ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
display:
	enter	0,0
	saveregs

	mov 	rcx, array
	
	mov 	rax, qword [rcx]
	call	print_int
	mov	al, ','
	call	print_char

	mov 	rax, qword [rcx+8]
	call	print_int
	mov	al, ','
	call	print_char

	mov 	rax, qword [rcx+16]
	call	print_int
	mov	al, ','
	call	print_char

	mov 	rax, qword [rcx+24]
	call	print_int
	mov	al, ','
	call	print_char

	mov 	rax, qword [rcx+32]
	call	print_int
	mov	al, ','
	call	print_char

	mov 	rax, qword [rcx+40]
	call	print_int
	mov	al, ','
	call	print_char

	mov 	rax, qword [rcx+48]
	call	print_int
	mov	al, ','
	call	print_char

	mov 	rax, qword [rcx+56]
	call	print_int

	call 	print_nl

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

	call	read_char	;Asks user for input (char) and saves it in al

	cmp	al, '0'
	je	asm_main_end
	cmp 	al, '1'
	jb	error1
	cmp	al, '8'
	ja	error1
	mov	r9, 0
	mov	r9b, al
	sub 	r9b, '0' 	;Saves value of 1st array to be swapped
	
	call	read_char
	
	cmp	al, ','
	jne	error2

	call	read_char

	cmp 	al, '1'
	jb	error1
	cmp	al, '8'
	ja	error1
	mov	r10, 0
	mov	r10b, al
	sub 	r10b, '0'	;Saves value of 2nd array to be swapped

	;;find the item with value r12
  loop1:
	mov	rbx, array
	cmp	r9, [rbx]
	je	have_first
	add 	rbx, 8
	jmp	loop1

  have_first:
	mov	r11, rbx
	mov	rbx, array

  loop2:
	cmp	r10, [rbx]
	je	have_second
	add 	rbx, 8
	jmp	loop2

  have_second:
	mov	r12, rbx
	mov	[r14], r13
	mov	[r15], r12
	
	call	 display

	jmp 	asm_main_end
	
  error1:
	mov 	rax, err1
	call	print_string
	jmp	asm_main_end

  error2:
	mov 	rax, err2
	call	print_string
	jmp	asm_main_end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Main program exit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_main_end:
	restoregs
	leave
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
