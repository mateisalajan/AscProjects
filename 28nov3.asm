assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab
; se da un sir care contine nr positive si negative.
; sa se creeze sirul pozitivelor si sirul negativelor din sir
s db 1, -2, -1,3,4 ; n=-2, -1 , p= 1, 3,4
ls equ $-s
n db ls dup (?)
p db ls dup (?)



data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
mov es, ax
; es= extrasegment
; incepand de aici vom scrie code

	mov si, offset s ; 
	mov di, offset n ; n
	mov bp, offset p; p
	mov cx, ls
	cld
	repeta:
		LODSB	
		;mov al, byte ptr s[si]
		;inc si
		cmp al, 0
		JGE pozitiv
		JL negativ
			pozitiv:
				xchg bp, di
				stosb
				xchg bp,di
				
			
			jmp myendif
			negativ:
				stosb 
	
	myendif:
	loop repeta
	
	
	
	
	
	
	



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start