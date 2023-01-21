assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab
; se da un sir in data segment.
; sa se printeze acest sir


; part 2
; sa se adune cont k
; sa se prnteze noul sir
s dw 123, 12, 2
ls equ ($-s)/2
d dw ls dup (?)

zece db 10
zecew dw 10
copie dw 0
newline db 10, 13,'$'
k equ 1


data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov si, 0
	mov cx, ls
		
	repeta:
	mov ax, word ptr s[si]
	
	mov copie, cx
		mov cx, 0; in cx vom numara cifrele puse pe stiva
		extragecifre:
		cwd
		idiv zecew ; ax -cat, dx- rest
		push dx 
		inc cx
		cmp ax, 0
		JNE extragecifre
		JE afisarenr
		
		afisarenr:
			pop dx; in dl e cifra efectiva
			add dl, '0'
			mov ah, 02h
			int 21h
			
		loop afisarenr; pentru ca in cx avem nr de ccifre de pe stiva
	
	mov cx, copie
	add si, 2; pentru a merge la urm elem din sir
	
	;afisare spatiu dupa un nr
	mov dl, ' '
	mov ah, 02h
	int 21h
	loop repeta
	
	mov ah, 09h
	mov dx, offset newline
	int 21h
	
	; adaugare valoarea k la elem sirului
	
	mov si, 0; s, d
	mov cx, ls
	modificasir:
		mov ax, word ptr s[si]
		add ax, k
		mov word ptr d[si], ax
		add si, 2
	loop modificasir
	
	; afisare sir d
	
	mov si, 0
	mov cx, ls
		
	repetad:
	mov ax, word ptr d[si]
	
	mov copie, cx
		mov cx, 0; in cx vom numara cifrele puse pe stiva
		extragecifred:
		cwd
		idiv zecew ; ax -cat, dx- rest
		push dx 
		inc cx
		cmp ax, 0
		JNE extragecifred
		JE afisarenrd
		
		afisarenrd:
			pop dx; in dl e cifra efectiva
			add dl, '0'
			mov ah, 02h
			int 21h
			
		loop afisarenrd; pentru ca in cx avem nr de ccifre de pe stiva
	
	mov cx, copie
	add si, 2; pentru a merge la urm elem din sir
	
	;afisare spatiu dupa un nr
	mov dl, ' '
	mov ah, 02h
	int 21h
	loop repetad
	
	
	
	
	
	
	
	
	
	
	



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start