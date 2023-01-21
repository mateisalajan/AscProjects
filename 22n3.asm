assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

zonacit db 10, ?, 10 dup (?)

nr dw 0 
zece db 10
zecew dw 10
newline db 10,13, '$'
data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov ah, 0ah
	mov dx, offset zonacit
	int 21h
	
	mov bl, byte ptr zonacit[1] ; in bl se salveaza nr concret de caract introduse (exlusiv enter)
	
	mov cl, bl
	mov ch, 0
	mov si, 2
	mov ax, 0
	crearenumar:
		mov bl, byte ptr zonacit[si]
		sub bl,'0' ; in bl este cifra 1
		imul zece ; ax = 0
		mov bh, 0
		add ax, bx
		inc si
	loop crearenumar
	mov nr, ax
	
	;printare linie noua pe ecran
	mov ah, 09h
	mov dx, offset newline
	int 21h
	
	; printare nr pe ecran
	;nr 1234
	mov ax, nr
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
	
	
	
		
		
	
	
	
	
	
	
	
	



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start