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

mov si,offset s
mov cx,ls
dec cx
repeta:
mov si,offset s
mov cx,ls
inc si
repcom:
mov al,byte ptr s[si]
inc si
cmp al,byte ptr s[si]
jc next
xchg al,byte ptr s[si]
xchg al,byte ptr s[si-1]
next:
dec ch
jz repcom
dec cl
jz repeta
hlt

mov si,offset s
mov di,offset p
mov cx,ls
adauga:
	mov al,byte ptr s[si]
	mov byte ptr p[di],al
	add di,1
	add si,1
loop adauga

mov ax, 4c00h
int 21h
code ends
end start