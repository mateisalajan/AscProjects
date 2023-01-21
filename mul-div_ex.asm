assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

; x/y + z*2 - 5/t + v -0Ah
; fara semn
x db 9
y dw 3
z dw 4
t dw 2
v dd 10
aux dd ?

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code
	; x/y  byte/word
	; x-> dx:ax
	mov al, x
	mov ah, 0
	mov dx, 0
		; dx:ax =x = 9
	div y ; 9/y = ax = 3
	
	; salvare ax in cx
	mov cx, ax ; cx= 3
	
	;z*2  word*const
	mov ax, 2
	mul z ; dx:ax = 8
	
	; trasnfer dx:ax in aux
	mov word ptr aux[0], ax
	mov word ptr aux[2], dx
	
	; 5/t  const/word
	; const sa fie in dx:ax
	mov ax, 5
	mov dx, 0
	div t ; ax = catul=2
	
	; x/y + z*2 - 5/t
	;   cx + aux - ax
	;    word + doubleword- word
	;     16  + 32      - 16
	; cx-ax
	sub cx, ax 
			; cx = x/y - 5/t
	; cx + aux
	; word+ doubleword
	; conver cx la combinatia de reg bx:cx
	mov bx, 0
	; bx    :cx +
	; aux[2]: aux[0]
	add cx, word ptr aux[0]
	adc bx, word ptr aux[2]
	  ; rez este in bx:cx =  x/y + z*2 - 5/t
	; 	; x/y + z*2 - 5/t + v
	;          bx:cx + v
	;            32 biti+ 32 biti
	; trasnfer v in dx:ax
	mov ax, word ptr v[0]
	mov dx, word ptr v[2]
	
	; bx:cx+
	; dx:ax
	add ax, cx
	adc dx, bx
	; dx:ax = x/y + z*2 - 5/t+v
	;x/y + z*2 - 5/t+v - 0ah
	; dx:ax - 
	;00 0ah
	sub ax, 0ah
	sub dx, 0
	
	; dx:ax = x/y + z*2 - 5/t+v -0ah
	          ;9/3 + 4*2 - 5/2  + 10 -0ah
			  ; 3 + 8- 2 +10-10 =9
			  ;dx=0000h
			  ;ax=0009

; x db 9
; y dw 3
; z dw 4
; t dw 2
; v dd 10


; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start