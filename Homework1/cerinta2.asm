.data
	delimitator: .asciz " "
	formatScanf: .asciz "%300[^\n]"
	formatPrintf: .asciz "%s\n"
	formatNr: .asciz "%d\n"
	res: .space 4 
	nr1: .space 4
	atoiRes: .space 4
	a: .space 4
	b: .space 4
	eval: .space 4
	str: .space 256
.text

.global main

main:
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
	
//	am aflat primul nr si l-am pus pe stiva
	pushl res
	call atoi
	popl %ebx
	movl %eax, nr1
	pushl nr1
	
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
	je operatie
	
//	daca nu este op, clar este numar
	pushl atoiRes
	jmp for

operatie:
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
	pushl $formatNr
	call printf
	popl %ebx
	popl %ebx

	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

