assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

;printarea unui sir de numere:
sir dw 1234, 123, 12, 4
ls equ ($-sir)/2
zecew dw 10
copie dw 0
newline db 10, 13, '$'




data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

	mov si, 0 ; sir
	mov cx, ls
	
	repetasir:
	mov bx, word ptr sir[si]
	; copie pentru cx de la repetasir
	mov copie, cx
	
	;printare un numar 
	mov cx, 0; aici vom numara cifrele din numar
	mov ax, bx
	repeta:
		cwd
		idiv zecew ; ax -cat, dx-rest
		push dx
		inc cx
		cmp ax, 0
		JNE repeta  ; conditia de oprire, cand ajunge catul la valoarea 0
		; salvarea cifrelor pe stiva 4, 3, 2, 1
		
		; scoatere cifre de pe stiva
		;conversia cifrelor la caracter
		
		repetafis:
			pop dx
			add dl, '0' 
			mov ah, 02h
			int 21h 		
		loop repetafis ;
			;sub cx, 1
			;cmp cx, 0
			;jne repetafis
			
	; end printare numar
	
	mov cx, copie
	add si, 2 ; pentru a merge la urmatorul elem din sir
	
	; printare de linie noua
	mov dx, offset newline
	mov ah, 09h
	int 21h
	
	loop repetasir
				
		
		
		
		





; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start