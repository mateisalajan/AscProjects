; e=(a*b-c)/d
assume ds:data,cs:code
data segment
	a dw 100
	b dw 50
	c dw -25
	d dw 5
	e dw ?
data ends

code segment

start:
mov ax,data
mov ds,ax
	mov ax,a
	mul b	; dx:ax = a*b
	mov bx,dx
	mov cx,ax ; bx:cx = a*b
	mov ax,c
	cwd 	; dx:ax = c
	sub dx,bx
	sbb dx,cx ; dx:ax = a*b-c
	idiv d	; ax = (a*b-c)/d
	mov e,ax
	
mov ax,4c00h
int 21h
code ends
end start