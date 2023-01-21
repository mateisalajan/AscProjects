assume cs:code,ds:data
data segment

	s db 20, ?, 20 dup(?)
	d dw 20 dup(?)
	lens dw ?
	
	; separator
	sep db ' '
	
	; newline
	newline db 10,13,'$'
	zeceb db 10
	zecew dw 10
	aux dw ?
	
data ends

code segment

afisare_numar proc
mov cx,0
repeta2:
	mov dx,0
	div zecew
	push dx
	inc cx
	cmp ax,0
jne repeta2

afisare:
	pop dx
	add dl,'0'
	mov ah,02h
	int 21h
loop afisare
ret
afisare_numar endp

start:
mov ax,data
mov ds,ax

; citire sir de la tastatura
mov ah,0ah
mov dx,offset s
int 21h

; identificare lungime efectiva sir citit (caractere introduse)
mov bl,byte ptr s[1]
mov bh,0
mov lens,bx ; lungimea efectiva
add lens,2	; pentru a se prelucra si ultimul separator s

mov si,2
mov di,0

prelucraresir:
	mov ax,0
	repeta:
		mul zeceb
		mov bl,byte ptr s[si]
		sub bl,'0'
		mov bh,0
		add ax,bx
		inc si
		mov bl,byte ptr s[si]
		cmp sep,bl
		je adaugainD
		jne repeta
			
			adaugainD:
				mov d[di],ax
				add di,2
				inc si
cmp si,lens
je afisareD
jne prelucraresir

afisareD:
	mov ah,09h
	mov dx,offset newline
	int 21h

mov aux,di ; in aux avem nr de bytes alocati pentru sirul de iesire
mov di,0

repetaafis:
	mov ax,d[di]
	call afisare_numar
	mov dl, ' '
	mov ah,02h
	int 21h
	add di,2
	cmp di,aux
	jne repetaafis
	
mov ax,4c00h
int 21h
code ends
end start