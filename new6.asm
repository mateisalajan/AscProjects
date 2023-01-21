assume cs:code,ds:data
data segment
	s db 10,?,10 dup(?)
	lens equ $-s
	d db 10 dup(?)
	newline db 10,13,'$'
data ends
code segment
start:
mov ax,data
mov ds,ax

mov si,offset s
mov di,offset d
mov cx,lens

repeta:
	mov ah,01h
	int 21h
	mov byte ptr s[si],al
	inc si
loop repeta

mov ah,09h
mov dx,offset newline
int 21h

mov si,offset s
mov di,offset d
mov cx,lens

repeta2:
	mov al,byte ptr s[si]
	mov byte ptr d[di],al
	inc si
	inc di
loop repeta2

mov si,offset s
mov di,offset d
mov cx,lens

repeta3:
	mov dl,byte ptr d[di]
	mov ah,02h
	int 21h
	inc di
	
	mov dl,32
	mov ah,02h
	int 21h
loop repeta3

mov ax,4c00h
int 21h
code ends
end start