assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

zonacit dw 20, ?, 20 dup (?)

nr dw 0 
nr2 dw 0
zeceb db 10
zecew dw 10
newline db 10,13, '$'
data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax

	mov ah, 0ah
	mov dx, offset zonacit
	int 21h
	
	mov bl, byte ptr zonacit[1] ; in bl se salveaza nr concret de caract introduse (exclusiv enter)
	
	mov cl, bl
	mov ch, 0
	mov si, 2
	mov ax, 0
	crearenumar:
        mul zeceb
		mov bl, byte ptr zonacit[si]
		sub bl,'0' ; in bl este cifra 1
		;mul zece ; ax = 0
		mov bh, 0
		add ax, bx
		inc si
	loop crearenumar
	add ax, 1
	mov nr, ax

	;printare linie noua pe ecran
	mov ah, 09h
	mov dx, offset newline
	int 21h

	mov ax, 1
	

	sir:
	mov nr2, ax
	mov cx, 0; in cx vom numara cifrele puse pe stiva

	extragecifre:
	mov dx, 0
	div zecew ; ax -cat, dx- rest
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
		
	loop afisarenr; pentru ca in cx avem nr de cifre de pe stiva

	mov ah, 09h
	mov dx, offset newline
	int 21h

	mov ax, nr2
	add ax, 1
	cmp ax, nr 
	JNE sir

; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start