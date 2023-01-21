assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

sirdeafisat db 'azi e marti $'


data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	
	mov ah, 01h
	int 21h
	; in al este caract introdus
	
	sub al, '0'
	; in al va fi efectiv valoarea cifei introduse
	
	add al, 3 ; se aduna 3
	
	; conversie la carcat
	add al, '0'
	
	mov dl, al
	mov ah,02h
	int 21h
	
	mov ah, 09h
	mov dx, offset sirdeafisat
	int 21h
	
	
	
	
	
	
	



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start