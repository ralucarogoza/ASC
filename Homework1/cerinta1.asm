.data
	indexSb2: .long 0
	index: .long 11
	doisprezece: .long 12
	putere: .long 1
	doi: .long 2
	doi2: .long 2
	bit3: .long 3
	nr: .long 0
	id: .long 0
	
	formatScanf: .asciz "%s"
	formatPrintfNumar: .asciz "%d "
	formatPrintfNumarNegativ: .asciz "-%d "
	formatPrintfVariabila: .asciz "%c "
	formatPrintfSir: .asciz "%s "
	formatPrintf: .asciz "\n"
	let: .asciz "let"
	add: .asciz "add"
	sub: .asciz "sub"
	mul: .asciz "mul"
	div: .asciz "div"
	
	n: .space 4
	semn: .space 4
	sirb16: .space 101
	sirb2:    .space 404

.text
	
.global main

main:
	pushl $sirb16
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	movl $sirb16, %edi
	movl $sirb2, %esi
	xorl %ecx, %ecx

for:
	movb (%edi, %ecx, 1), %al
	cmp $0, %al
	je grupe

	cmp $48, %al
	je cif0
	cmp $49, %al
	je cif1
	cmp $50, %al
	je cif2
	cmp $51, %al
	je cif3
	cmp $52, %al
	je cif4
	cmp $53, %al
	je cif5
	cmp $54, %al
	je cif6
	cmp $55, %al
	je cif7
	cmp $56, %al
	je cif8
	cmp $57, %al
	je cif9
	cmp $65, %al
	je cif10
	cmp $66, %al
	je cif11
	cmp $67, %al
	je cif12
	cmp $68, %al
	je cif13
	cmp $69, %al
	je cif14
	cmp $70, %al
	je cif15

cont:
	incl %ecx
	jmp for

cif0:
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont

cif1:
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont

cif2:
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont
cif3:
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont
cif4:
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont
cif5:
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont
cif6:
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont
cif7:
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont
cif8:
	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont

cif9:
	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont
cif10:
	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont
cif11:
	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont
cif12:
	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont
cif13:
	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont
cif14:
	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont
cif15:
	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	addl $4, indexSb2
	popl %ecx
	jmp cont

grupe:
	pushl $sirb2
	call strlen
	popl %ebx
	
	xorl %edx, %edx
	divl doisprezece
	movl %eax, n
	movl n, %ebp
	movl $sirb2, %edi
	movl index, %ecx
	jmp for2
	
for2:
//	in ebp retin nr de grupe
	cmp $0, %ebp
	je exit
	
	movl $0, %eax
	movl %eax, nr
	movl $1, %eax
	movl %eax, putere
	movl $2, %eax
	movl %eax, doi
	movl $0, %eax
	movl %eax, id
		
	decl %ebp
	jmp numar

numar:
	cmp bit3, %ecx
	je identificator 

	movb (%edi, %ecx, 1), %al
	sub $48, %al
	movb %al, n
	movl n, %eax
	mull putere
	movl %eax, n
	movl putere, %eax
	mull doi
	movl %eax, putere
	
//	adun ca sa formez numarul
	movl n, %eax
	addl %eax, nr
	
	decl %ecx
	jmp numar

	
identificator:
//	retin bitul de semn
	movb (%edi, %ecx, 1), %al
	sub $48, %al
	movb %al, semn

	decl %ecx	

	movb (%edi, %ecx, 1), %al
	sub $48, %al
	movb %al, n
	movl n, %eax
	addl %eax, id
	
	decl %ecx
	
	movb (%edi, %ecx, 1), %al
	sub $48, %al
	movb %al, n
	movl n, %eax
	mull doi2
	addl %eax, id
	
	decl %ecx

	movl id, %eax
	cmp $0, %eax
	je numar_intreg
	cmp $1, %eax
	je variabila
	cmp $2, %eax
	je operatie

numar_intreg:
	movl semn, %eax
	cmp $1, %eax
	je numar_intreg_negativ
	movl nr, %eax
	pushl %eax
	pushl $formatPrintfNumar
	call printf
	popl %ebx
	popl %ebx
	jmp cont2
	
numar_intreg_negativ:
	movl nr, %eax
	pushl %eax
	pushl $formatPrintfNumarNegativ
	call printf
	popl %ebx
	popl %ebx
	jmp cont2


variabila:
	pushl nr
	pushl $formatPrintfVariabila
	call printf
	popl %ebx
	popl %ebx

	jmp cont2

operatie:
	movl nr, %eax
	cmp $0, %eax
	je operatia_let
	cmp $1, %eax
	je operatia_add
	cmp $2, %eax
	je operatia_sub
	cmp $3, %eax
	je operatia_mul
	cmp $4, %eax
	je operatia_div

operatia_let:
	pushl $let
	pushl $formatPrintfSir
	call printf
	popl %ebx
	popl %ebx

	jmp cont2

operatia_add:
	pushl $add
	pushl $formatPrintfSir
	call printf
	popl %ebx
	popl %ebx

	jmp cont2
	
operatia_sub:
	pushl $sub
	pushl $formatPrintfSir
	call printf
	popl %ebx
	popl %ebx

	jmp cont2

operatia_mul:
	pushl $mul
	pushl $formatPrintfSir
	call printf
	popl %ebx
	popl %ebx
	
	jmp cont2

operatia_div:
	pushl $div
	pushl $formatPrintfSir
	call printf
	popl %ebx
	popl %ebx

	jmp cont2

cont2:
	movl index, %eax
	addl $12, %eax
	movl %eax, %ecx
	movl %eax, index
	addl $12, bit3
	jmp for2
	

exit:
	pushl $formatPrintf
	call printf
	popl %ebx

	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
