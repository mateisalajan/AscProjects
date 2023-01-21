;6.  Se da un sir S de dublucuvinte. 
;Sa se obtina sirul D format din octetii inferiori ai cuvintelor inferioare din elementele sirului de dublucuvinte, care sunt multiplii de 7. 
;Exemplu:
;s DD 12345607h, 1A2B3C15h, 13A33412h
;d DB 07h, 15h

assume cs:code, ds:data
data segment
  s dd 12345607h, 1A2B3C15h, 13A33412h
  ls equ ($-s)/4
  d db ls dup(?)
  k db 7
data ends

code segment
start:
  mov ax, data
  mov ds, ax
  
  mov cx,ls
  mov si,0
  mov di,0
  
repeta:
	mov ax,word ptr s[si+0]
	mov dx,word ptr s[si+2]
	mov ah,0
	div k
	cmp ah,0
	je adauga
	jne next
	adauga:
		mov ax,word ptr s[si+0]
		mov byte ptr d[di],al
		add si,4
		add di,1
	jmp myendif
	next:
		add si,4
	myendif:
loop repeta
	mov ax, 4c00h ; terminam programul
	int 21h
code ends
end start