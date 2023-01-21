;15. Se da un sir de dublucuvinte. Sa se salveze in sirul D in ordine inversa toate cuvintele din sirul initial.

assume cs:code, ds:data
data segment
  s dd 12345678h,1A2B3C4Dh,0FE98DC76h
  ls equ ($-s)/4
  d dd ls dup(?)
data ends

code segment
start:
  mov ax, data
  mov ds, ax

  mov si,(ls*4)-4
  mov cx,ls
  mov di,0
  
repeta:
	mov ax,word ptr s[si+0]
	mov dx,word ptr s[si+2]
	mov word ptr d[di+0],ax
	mov word ptr d[di+2],dx
	sub si,4
	add di,4
loop repeta
	mov ax, 4c00h ; terminam programul
	int 21h
code ends
end start