;A.6. Se da un sir de octeti S. Sa se obtina sirul D1 ce contine toate numerele pare din S si sirul D2 ce contine toate numerele impare din S. 
;Exemplu:
;S: 1, 5, 3, 8, 2, 9
;D1: 8, 2
;D2: 1, 5, 3, 9

assume cs:code, ds:data
data segment
  s db 1,5,3,8,2,9
  ls equ $-s
  p db ls dup(?)
  i db ls dup(?)
data ends

code segment
start:
  mov ax, data
  mov ds, ax
  
  mov cx,ls
  mov si,0
  mov di,0
  mov bp,0
  
repeta:
	mov al,byte ptr s[si]
	mov ah,0
	mov bl,2
	div bl
	cmp ah,0
	jne impare
	mov al,byte ptr s[si]
	mov byte ptr p[di],al
	add di,1
	add si,1
	jmp myendif
	impare:
		mov al,byte ptr s[si]
		mov byte ptr i[bp],al
		add bp,1
		add si,1
	myendif:
loop repeta
	mov ax, 4c00h ; terminam programul
	int 21h
code ends
end start