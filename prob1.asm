assume cs:code, ds:data
data SEGMENT

a db 5
b db 6
z dw ?


data ENDS
code SEGMENT

;z=1/(a*a+b*b-5)+2/(a*a-b*b+4)
start:
mov ax, data
mov ds, ax

	mov al,a
	mul a
	mov bx, ax


	mov al,b
	mul b


	add bx,ax


	sub bx, 5
	
	mov ax,1
	mov dx,0
	div bx
	mov cx,ax
	mov z,cx

	mov al,a
	mov ah,0
	mul a
	mov bx, ax


	mov al,b
	mov ah,0
	mul b


	sub bx,ax


	add bx, 4

	mov ax, 2
	mov dx, 0
	div bx
	mov cx,ax
	

	add z,cx

	
mov ax,4C00h
int 21h
code ENDS
END start