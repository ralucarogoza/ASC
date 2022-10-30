.data
	v: .long 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	delimitator: .asciz " "
	formatScanf: .asciz "%300[^\n]"
	formatPrintf: .asciz "%d\n"
	str: .space 256
	res: .space 4
	eval: .space 4
	atoiRes: .space 4
	poz: .space 4
	var: .space 4
	a: .space 4
	b: .space 4
.text

.global main

main:
	movl $v, %esi
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

	movl %eax, res
//	aflu primul nr/ var		
	pushl res
	call atoi
	popl %ebx
	movl %eax, atoiRes
	cmp $0, atoiRes
	je var_op
//	daca nu este variabila si nici operatie, atunci este numar
	pushl atoiRes
	jmp for

for:
	pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	cmp $0, %eax
	je exit

	movl %eax, res
	pushl res
	call atoi
	popl %ebx
	movl %eax, atoiRes

	cmp $0, atoiRes
	je var_op

//	daca nu este variabila si nici operatie, atunci este numar
	pushl atoiRes
	jmp for

var_op:
	pushl res
	call strlen
	popl %ebx
	cmp $1, %eax
	je variabila
	jmp operatie
	
variabila:
//	aici aflu pozitia variabilei in vector	
	movl res, %edi
	xorl %ecx, %ecx
	movb (%edi, %ecx, 1), %al
	sub $97, %al
	movb %al, poz
	
//	verific daca variabila a mai fost utilizata	
	movl poz, %ecx
	movb (%esi, %ecx, 4), %al
	cmp $0, %al
	je variabila_nefolosita

	jmp variabila_folosita

variabila_nefolosita:
//	daca variabila nu a mai fost utilizata pun variabila pe stiva
	pushl res
	jmp for

variabila_folosita:
//	daca variabila a mai fost utilizata pun valoarea ei pe stiva
	movb %al, var
	pushl var
	jmp for

operatie:
	movl res, %edi
	xorl %ecx, %ecx
	movb (%edi, %ecx, 1), %al
	cmp $108, %al
	je operatia_let
	cmp $97, %al
	je operatia_add
	cmp $115, %al
	je operatia_sub
	cmp $109, %al
	je operatia_mul
	cmp $100, %al
	je operatia_div

operatia_let:
	popl a
	popl b
	movl poz, %ecx
	movb a, %al
	movb %al, (%esi, %ecx, 4)
	jmp for

operatia_add:
	popl a
	movl a, %eax
	popl b
	addl b, %eax
	pushl %eax
	jmp for

operatia_sub:
	popl a
	popl b
	movl b, %eax
	subl a, %eax
	pushl %eax
	jmp for

operatia_mul:
	popl a
	popl b
	movl a, %eax
	movl b, %ebx
	mull %ebx
	pushl %eax
	jmp for

operatia_div:
	popl a
	popl b
	xorl %edx, %edx
	movl b, %eax
	movl a, %ebx
	divl %ebx
	pushl %eax
	jmp for

exit:
	popl eval
	pushl eval
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
