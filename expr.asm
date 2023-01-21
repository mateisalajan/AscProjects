assume cs:code,ds:data
data segment
	s db 20,?,20 dup(?)
	newline db 10,13,'$'
	zecew dw 10
	nr dw 0
	nr2 dw 0
	i dw ?
data ends
code segment
start:
mov ax,data
mov ds,ax

mov ah,0ah
mov dx,offset s
int 21h

mov bl,byte ptr s[1]
mov cl,bl
mov ch,0

mov si,2
mov ax,0
repeta:
	mul zecew
	mov bl,byte ptr s[si]
	sub bl,'0'
	mov bh,0
	add ax,bx
	inc si
loop repeta
add ax,1
mov nr,ax

mov ah,09h
mov dx,offset newline
int 21h

mov ax,1
mov i,0

sir:
	mov cx,0
	mov nr2,ax
	repeta2:
		mov dx,0
		div zecew
		push dx
		inc cx
		cmp ax,0
		je afisare
		jne repeta2
		afisare:
			pop dx
			add dl,'0'
			mov ah,02h
			int 21h
		loop afisare
		mov ah,09h
		mov dx,offset newline
		int 21h 
		
		add i,1
		mov ax,nr2
		add ax,i
		mov bx,i
		cmp nr,bx
		jne sir

mov ax,4c00h
int 21h
code ends
end start