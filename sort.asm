.model small
.stack 100h
assume cs:code, ds:data
data segment
	s db 9,2,3,4,1,6
	ls equ $-s
	p db ls dup(?)
data ends

code segment
start:
mov ax, data
mov ds, ax

mov si,0
mov cx,ls
sub cx,1
nextscan:
    mov bx,cx
    mov si,0

	nextcomp:

		mov al,byte ptr s[si]
		mov dl,byte ptr s[si+1]
		cmp al,dl
	
		jl noswap
	
		mov byte ptr s[si],dl
		mov byte ptr s[si+1],al
		 
	noswap: 
		add si,1
		sub bx,1
		jnz nextcomp
loop nextscan

mov cx,ls
mov si,0
mov di,0

repeta:
	mov al,byte ptr s[si]
	mov byte ptr p[di],al
	add si,1
	add di,1
loop repeta

mov cx,ls
mov di,0

output:
	mov dl,byte ptr p[di]
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