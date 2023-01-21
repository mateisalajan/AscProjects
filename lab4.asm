;6. Se sa citeasca un sir de cifre a. Sa se salveze in sirul b doar cifrele pare. Sa se afiseze sirul b pe ecran

.model small
.stack 100h
assume cs:code, ds:data
data segment
	a db 20 dup(?)
	len equ $-a
	b db len dup(?)
	msg1 db 'Dati cifrele sirului:','$'
	msg2 db 'Sirul b este:','$'
data ends

code segment
start:

mov ax,data
mov ds,ax

mov cx,len
mov si,offset a
mov di,offset b

;afisam primul mesaj
lea dx,msg1
mov ah,09h
int 21h

;input
input:
	mov ah,01h
	int 21h
	mov byte ptr a[si],al
	inc si
loop input

;new line
mov ah,2 
mov dl,0Dh
int 21h

;construim sirulu b(cu elem pare ale lui a)
mov cx,len
mov si,offset a
repeta:
	mov al,byte ptr a[si]
	mov ah,0
	mov bl,2
	div bl
	cmp ah,0
	jne next
	mov al,byte ptr a[si]
	mov byte ptr b[di],al
	add di,1
	next:
		add si,1
	myendif:
loop repeta

;afisam al doilea mesaj
lea dx,msg2
mov ah,09h
int 21h

;output
mov cx,len
mov di,offset b
output:
	mov dl,byte ptr b[di]
	mov ah,2
	int 21h
	add di,1
	
	mov dl,32
	mov ah,2
	int 21h
loop output

mov ax, 4c00h
int 21h
code ends
end start