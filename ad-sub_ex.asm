assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab


x db 7

y dw 14  ; 16 biti



data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code
		; addunare
		;add op1, op2
		; op1<-op1+op2
		; op1 - nu poate fi const
		; op1, op2 -  aceasi dimensiune/ acelasi tip
		; cel putin un operand trebuie sa fie registru sau constanta
mov ax, 0
add ax, 6 ; ax = ax +6  = 6
mov bx, 2
add ax, bx  ; ax = ax + bx = 8

;add ax, x  ; nu funct, ax  - word (16 biti)
			; x - byte, 8 biti

		
; scaderea 
; sub op1,op2
; op1<-op1-op2
		; op1 - nu poate fi const
		; op1, op2 -  aceasi dimensiune/ acelasi tip
		; cel putin un operand trebuie sa fie registru sau const

; 5-4 + y, y - word

mov al, 5
mov bl, 4
sub al, bl  ; al = al-bl = 5-4 = 1
mov ah, 0 ; ah =0 
		; ah=0, al=1 => ax = 1 (0001h)
add ax, y



; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start