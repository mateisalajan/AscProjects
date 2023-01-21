assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

; se da un sir de carcatere. s= aAbBxX
; a) sa se extraga toate literele mari din sir ; d= ABX
; b) sa se extraga toate vocalele din sir ; d1 = aA

s db 'aAbBxX'
ls equ $-s
voc db 'aeiouAEIOU'
lv equ $-voc
u db ls dup (?) ; ABX
d1 db ls dup (?) ; aA

copie dw 0
nrv db 0
data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
mov es,ax
; ; incepand de aici vom scrie code
	; ;a) sa se extraga toate literele mari din sir ; d= ABX
	; mov si, offset s
	; mov di, offset u
	; mov cx, ls
	; cld
	; repeta1:
		; lodsb 
		; ; mov al, byte s[si]
		; ; inc si
		; cmp al, 'A'
		; JB nueupper
		; JAE verificaZ
			; verificaZ:
				; cmp al, 'Z'
				; JBE adaugainU
				; JA nueupper
					; adaugainU:
						; stosb
					
					; nueupper:
	; loop repeta1
	
	; ; punem $ pe ultima pozitie
	
	; mov bl, '$'
	; mov byte ptr u[di], bl
	; ; afisare u
	; mov ah,09h
	; mov dx, offset u
	; int 21h 
	
	
	; ; b) sa se extraga toate vocalele din sir ; d1 = aA
	cld
	mov si, offset s
	mov di, offset d1
	
	mov cx, ls
	repeta2:
		lodsb 
		; mov al, byte s[si]
		; inc si
		mov copie, cx
		mov cx, lv
		mov bp, 0; pentru parcurgere sir de vocale
		repeta3:
			mov bl, byte ptr voc[bp]
			cmp bl, al
			
			JE adaugainD1 ; sirul vocalelor
			JNE myendif
				adaugainD1:
					stosb
								inc nrv

					
				myendif:
				add bp, 1
		loop repeta3
		mov cx, copie
	loop repeta2
	
	;printare sir vocale
		; punem $ pe ultima pozitie
	
	;mov bl, '$'
	;mov byte ptr d1[di], bl
	; afisare d1
	mov di,0
	mov cl, nrv
	mov ch, 0
	repetaafis:
	mov al, byte ptr d1[di]
	add di,1
	mov ah, 02h
	mov dl, al
	int 21h 
	loop repetaafis
	
	
	
	
	
	
	



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start