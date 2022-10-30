.data
	minusdoi: .long -2
	delimitator: .asciz " "
	formatScanf: .asciz "%300[^\n]"
	formatPrintf: .asciz "%d "
	formatPrintfN: .asciz "-%d "
	formatPrintfSir: .asciz "%s\n"
	newline: .asciz "\n"
	v: .space 1600
	nr_elemente: .space 4
	operand: .space 4
	n: .space 4
	m: .space 4
	a: .space 4
	b: .space 4
	res: .space 4
	str: .space 500
	elem: .space 4
	nume_matrice: .space 4
	
.text
.global main

main:
	lea v, %esi
	pushl $str
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	pushl $delimitator
	pushl $str
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax, nume_matrice

	pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	
	movl %eax, res

	pushl res
	call atoi
	popl %ebx
	movl %eax, n

	pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 

	movl %eax, res

	pushl res
	call atoi
	popl %ebx
	movl %eax, m

	movl n, %eax
	movl m, %ebx
	mull %ebx
	movl %eax, nr_elemente
	xorl %ecx, %ecx

for:
	pushl %ecx
	cmp nr_elemente, %ecx
	je cont

	pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	
	movl %eax, res

	pushl res
	call atoi
	popl %ebx
	movl %eax, elem
	
	popl %ecx
	movl elem, %eax
	movl %eax, (%esi, %ecx, 4)
	pushl %ecx

	popl %ecx
	incl %ecx
	jmp for

cont:
	popl %ecx
	pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	
	movl %eax, res

	movl res, %edi
	xorl %ecx, %ecx
	movb (%edi, %ecx, 1), %al
	cmp $108, %al
	je let_afis
	cmp $114, %al
	je rotatie_afis

let_afis:
	pushl n
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

	pushl m
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

	jmp let
let:
//	extrag operandul
	pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	
	movl %eax, res
	
	pushl res
	call atoi
	popl %ebx
	movl %eax, operand

//	aflu operatia
	pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	
	movl %eax, res
	movl res, %edi
	xorl %ecx, %ecx
	movb (%edi, %ecx, 1), %al
	cmp $97, %al
	je operatia_add
	cmp $115, %al
	je operatia_sub
	cmp $109, %al
	je operatia_mul
	cmp $100, %al
	je operatia_div
	
//	ecx ul a ramas 0 de la verificarea operatiei
operatia_add:
	pushl %ecx
	cmp %ecx, nr_elemente
	je exit
	
	movl (%esi, %ecx, 4), %eax
	movl %eax, elem

	movl elem, %eax
	addl operand, %eax
	movl %eax, elem
	movl elem, %eax
	movl %eax, (%esi, %ecx, 4)
	pushl elem
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

	popl %ecx
	incl %ecx
	jmp operatia_add

operatia_sub:
	pushl %ecx
	cmp %ecx, nr_elemente
	je exit

	movl (%esi, %ecx, 4), %eax
	subl operand, %eax
	movl %eax, elem
	movl elem, %eax
	movl %eax, (%esi, %ecx, 4)
	pushl elem
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

	popl %ecx
	incl %ecx
	jmp operatia_sub

operatia_mul:
	pushl %ecx
	cmp %ecx, nr_elemente
	je exit

	movl (%esi, %ecx, 4), %eax
	movl operand, %ebx
	xorl %edx, %edx
	imull %ebx
	movl %eax, elem
	movl elem, %eax
	movl %eax, (%esi, %ecx, 4)
	pushl elem
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

	popl %ecx
	incl %ecx
	jmp operatia_mul
	
operatia_div:
	pushl %ecx
	cmp %ecx, nr_elemente
	je exit
	movl (%esi, %ecx, 4), %eax
	movl %eax, a
	movl operand, %ebx
	movl %ebx, b
	cmp  $0, %ebx
	jl b_mai_mic_decat_0
	cmp $0, %ebx
	jg b_mai_mare_decat_0

b_mai_mic_decat_0:
	cmp $0, %eax
	jl a_mai_mic_decat_0
	cmp $0, %eax
	jg a_mai_mare_decat_0

a_mai_mic_decat_0:
	movl a, %eax
	movl minusdoi, %ebx
	imull %ebx
	add a, %eax
	movl %eax, a
	movl b, %eax
	imull %ebx
	add b, %eax
	movl %eax, b
	
	movl a, %eax
	movl b, %ebx
	xorl %edx, %edx
	divl %ebx
	movl %eax, elem
	
	pushl elem
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	jmp cont_div
	
a_mai_mare_decat_0:
	movl b, %eax
	movl minusdoi, %ebx
	imull %ebx
	add b, %eax
	movl %eax, b
	movl b, %ebx
	xorl %edx, %edx
	movl a, %eax
	divl %ebx
	movl %eax, elem
	
	cmp $0, elem
	je minus0
	
	pushl elem
	pushl $formatPrintfN
	call printf
	popl %ebx
	popl %ebx
	jmp cont_div

b_mai_mare_decat_0:
	cmp $0, %eax
	jl a_mai_mic_decat_0_2
	cmp $0, %eax
	jg a_mai_mare_decat_0_2

a_mai_mic_decat_0_2:
	movl a, %eax
	movl minusdoi, %ebx
	imull %ebx
	add a, %eax
	xorl %edx, %edx
	movl b, %ebx
	divl %ebx
	movl %eax, elem

	cmp $0, elem
	je minus0
	
	pushl elem
	pushl $formatPrintfN
	call printf
	popl %ebx
	popl %ebx
	jmp cont_div

a_mai_mare_decat_0_2:
	movl a, %eax
	movl b, %ebx
	xorl %edx, %edx
	divl %ebx
	movl %eax, elem
	
	pushl elem
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	jmp cont_div

minus0:
	pushl elem
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	jmp cont_div 

cont_div:
	popl %ecx
	incl %ecx
	jmp operatia_div
	
rotatie_afis:
	jmp exit
	
exit:
	popl %ecx
	
	pushl $newline
	call printf
	popl %ebx

	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
