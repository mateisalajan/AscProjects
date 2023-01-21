assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

	; a/3 + c*2 - 0101b
	; a byte
	; c word
	
	a db 7  ; 07 h -> in mem: 07
	c dw 5  ; 0005h -> in mem: 05  00
	rez dd ? ; aici vom salva rezultatul
			; dx=0000h
			; ax=0007h
			;dx:ax: 00000007h-> in mem: 07 00 00 00 = rez
	
data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code
	; a/3 
	; byte/constanata
	; byte/byte
	;=> word/byte
	;a byte-> a word
	mov al, a
	mov ah, 0
		; ax = a
	mov bl, 3
	div bl ; ax / bl = al cat si ah rest 
		;al = a/3  ; continuam doar cu catul, se ignora restul
		mov bl, al ; bl = a/3
	
	; c*2
	; word*const
	; word * word
	mov ax, c
	mov cx, 2 
	mul cx ; dx:ax=ax*cx = c*2
	
	;a/3 + c*2
	; bl + dx:ax
	; bl -> combinatie de registrii CX:BX
	mov bh, 0
	mov cx, 0 
	; din linia 33 si liia 45 si linia 46-> in cx:bx = a/3
	
	;a/3 + c*2
	;cx:bx +
	;dx:ax
	add ax, bx
	adc dx, cx 
		; dx:ax = a/3 + c*2
		
	; a/3 + c*2 - 0101b
	; dx:ax - 0101b
	sub ax, 0101b
	sbb dx, 0
		; dx:ax = a/3 + c*2 - 0101b
		
	; transferul reg dx:ax in variab rez
	mov word ptr rez[0], ax
	mov word ptr rez[2], dx 
	
	
	




; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start