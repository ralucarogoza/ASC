.data
	n: .space 4
	m: .space 4
	trein: .space 4
	x: .space 4
	delimitator: .asciz " "
	formatScanf: .asciz "%300[^\n]"
	formatPrintf: .asciz "%d "
	newline: .asciz "\n"
	v: .space 500
	fr: .space 300
	stop: .long 0
	k: .space 4
	ok: .space 4
	str: .space 500
	res: .space 4
	r: .space 4
.text

citire:
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

	pushl res
	call atoi
	popl %ebx
	movl %eax, n
	addl n, %eax
	addl n, %eax
	movl %eax, trein
	
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


	
	xorl %ecx, %ecx
	jmp citire_vector
	
citire_vector:
	cmp %ecx, trein
	je citire_final
	
	pushl %ecx
	
	pushl $delimitator
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	
	movl %eax, res

	pushl res
	call atoi
	popl %ebx
	movl %eax, x
	
	popl %ecx
	movl x, %eax
	movl %eax, (%esi, %ecx, 4)
	pushl %ecx
	
	cmp $0, %eax
	jne frecventa
	
	jmp citire_vector_cont
	
frecventa:
	movl x, %ebx
	movl (%edi, %ebx, 4), %eax
	addl $1, %eax
	movl %eax, (%edi, %ebx, 4)
	jmp citire_vector_cont
	
citire_vector_cont:
	popl %ecx
	incl %ecx
	jmp citire_vector
	
citire_final:
	ret

verificare_vector:
	pushl %ebp
	movl %esp, %ebp
	
	movl 8(%ebp), %eax
	movl %eax, r
	
	xorl %ecx, %ecx
	jmp verificare_vector_for

verificare_vector_for:
	cmp %ecx, trein
	je corect
	
	pushl %ecx
	movl (%esi, %ecx, 4), %eax
	
	cmp $0, %eax
	je verificare_vector_for_cont
	
	movl $1, %ebx
	jmp verificare_vector_for_2
	
verificare_vector_for_2:
	movl m, %eax
	addl $1, %eax
	cmp %ebx, %eax
	je verificare_vector_for_cont
	
	pushl %ebx
	movl %ebx, %eax
	addl %ecx, %eax
	cmp %eax, trein
	jg conditie1
	
	movl %ecx, %eax
	subl %ebx, %eax
	cmp $0, %eax
	jge conditie2
	
	jmp verificare_vector_for_2_cont
	
conditie1:
	movl %ecx, %eax
	addl %ebx, %eax
	movl (%esi, %eax, 4), %edx
	movl (%esi, %ecx, 4), %eax
	
	cmp %eax, %edx
	je gresit
	
	movl %ecx, %eax
	subl %ebx, %eax
	cmp $0, %eax
	jge conditie2
	
	jmp verificare_vector_for_2_cont
	
conditie2:
	movl %ecx, %eax
	subl %ebx, %eax
	movl (%esi, %eax, 4), %edx
	movl (%esi, %ecx, 4), %eax
	cmp %eax, %edx
	je gresit
	
	jmp verificare_vector_for_2_cont
	
	
verificare_vector_for_2_cont:
	popl %ebx
	incl %ebx
	jmp verificare_vector_for_2

verificare_vector_for_cont:
	popl %ecx
	incl %ecx
	jmp verificare_vector_for
	
gresit1:
	pushl $-1
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	jmp exit
	
gresit:
	movl $-1, r
	popl %ebx
	popl %ecx
	popl %ebp
	ret
	
corect:
	movl $1, r
	popl %ebp
	ret

bkt:
	pushl %ebp
	movl %esp, %ebp
	
	movl stop, %ebx
	cmp $1, %ebx
	je returni
	
	movl 8(%ebp), %eax
	movl %eax, k
	
	movl trein, %ebx
	cmp k, %ebx
	jle afisare_vector
	
	movl k, %ecx
	movl (%esi, %ecx, 4), %ebx
	cmp $0, %ebx
	jne bkt_cont
	
	movl $1, %ecx
	jmp bkt_for
	
returni:
	popl %ebp
	ret 	
	
bkt_cont:
	movl k, %ebx
	addl $1, %ebx
	movl %ebx, k
	
	pushl k
	call bkt
	popl %ebx
	
	jmp returni
	
bkt_for:
	cmp n, %ecx
	jg returni
	
	movl stop, %edx
	cmp $1, %edx
	je returni
	
	movl (%edi, %ecx, 4), %edx
	cmp $3, %edx
	je bkt_for_cont
	
	movl $1, ok
	movl $1, %ebx
	jmp bkt_for2
	
bkt_for2:
	cmp m, %ebx
	jg dupa_for2
	
	movl k, %edx
	addl %ebx, %edx
	cmp trein, %edx
	jl conditie3
	
	movl k, %edx
	subl %ebx, %edx
	cmp $0, %edx
	jge conditie4
	
	jmp bkt_for2_cont
	
conditie3:
	movl (%esi, %edx, 4), %eax
	cmp %ecx, %eax
	je breakt
	
	movl k, %edx
	subl %ebx, %edx
	cmp $0, %edx
	jge conditie4
	
	jmp bkt_for2_cont
	
conditie4:
	movl (%esi, %edx, 4), %eax
	cmp %ecx, %eax
	je breakt
	
	jmp bkt_for2_cont
	
breakt:
	movl $0, ok
	jmp dupa_for2
	
bkt_for2_cont:
	incl %ebx
	jmp bkt_for2	
	
dupa_for2:
	movl ok, %edx
	cmp $0, %edx
	je bkt_for_cont
	movl (%edi, %ecx, 4), %eax
	addl $1, %eax
	movl %eax, (%edi, %ecx, 4)
	movl k, %eax
	movl %ecx, (%esi, %eax, 4)
	
	addl $1, %eax
	movl %eax, k
	
	pushl %ebx
	pushl %ecx
	
	pushl k
	call bkt
	popl k
	
	movl k, %eax
	subl $1, %eax
	movl %eax, k
	
	popl %ecx
	popl %ebx
	
	movl (%edi, %ecx, 4), %eax
	subl $1, %eax
	movl %eax, (%edi, %ecx, 4)
	movl k, %eax
	movl $0, (%esi, %eax, 4)
	
	jmp bkt_for_cont
	
bkt_for_cont:
	incl %ecx
	jmp bkt_for
	
	
afisare_vector:
	movl $1, stop
	xorl %ecx, %ecx
	jmp afisare_vector_cont
	
afisare_vector_cont:
	cmp trein, %ecx
	je returni
	
	pushl %ecx
	movl (%esi, %ecx, 4), %eax
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	incl %ecx
	jmp afisare_vector_cont
	
.global main

main:
	lea v, %esi
	lea fr, %edi
	call citire

rez:
	movl n, %eax
	movl m, %ebx
	
	cmp %ebx, %eax
	jle gresit1
	
	movl $0, r
	pushl r
	call verificare_vector
	popl r
	
	movl r, %eax
	cmp $-1, %eax
	je exit1
	
	movl $0, k
	pushl %esi
	pushl k
	call bkt
	popl %ebx
	popl %esi


	movl stop, %ebx
	cmp $0, %ebx
	je exit1
	
	jmp exit
	
exit1:
	pushl $-1
//	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	pushl $newline
	call printf
	popl %ebx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

exit:
	pushl $newline
	call printf
	popl %ebx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
