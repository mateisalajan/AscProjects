assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab
; se da un sir de caract in data segm.
; sa se inverseze acest sir.
; sa se printeze sirul inversat pe ecran
; s= ab +-
; d = -+ ba

s db 'ab +-' ; echivalent cu s db 'a', 'b', ' ', '+', '-'
ls equ $-s ; 5
d db ls dup (?)


data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov si, ls-1; s
	mov di, 0; d
	mov cx, ls
	repeta:
		mov al, byte ptr s[si]
		mov byte ptr d[di], al
		inc di
		sub si, 1
	loop repeta
	
	; afisarea sirului d
	mov al, '$'
	mov byte ptr d[di], al
	mov ah, 09h
	mov dx, offset d
	int 21h
	
	
	
	
	
	
	
	
	



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start