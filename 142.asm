assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab
; se da un sir de caract. sa se printeze pe ecran sirul caract inversate.
s db 'abc','+', '-'
ls equ $-s

d db ls dup (?)



data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code
	mov si, ls-1 ; s 
	mov cx, ls
	mov di, 0 ; d
	repeta:
		mov al, byte ptr s[si]
		mov byte ptr d[di], al
		dec si
		inc di
	loop repeta
	
	
	mov byte ptr d[di], '$'
	mov ah, 09h
	mov dx, offset d
	int 21h
		




; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start