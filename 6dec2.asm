assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab
s db 'abc'
ls equ $-s
d db ls dup (?)
f db ls dup (?)


data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
mov es, ax
; incepand de aici vom scrie code

	cld
	mov si, offset s
	mov di, offset d
	mov cx, ls
	repeta:
		lodsb
		stosb
	loop repeta
	
	
	; sirul f = cba
	
	mov si, offset s
	add si, ls-1
	mov di, offset f
	mov cx, ls
	repetaf:
		std
		lodsb
		cld
		stosb
	loop repetaf
	
	
	
	
	
	
	
	
	



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start