assume cs:code, ds:data
data SEGMENT

	a dw 5
	b db 6
	c db 3
	d dw 1
	g db 7
	f db 9
	h dw 4
	z dw ?

data ends

code segment
start:
mov ax,data
mov ds,ax

; z=((a+b*c-d)/f+h)/g
	mov al,b
    mul c
	
	add ax,a

	sub ax,d

	div f
	mov ah, 0

	add ax,h

	div g
	
	mov z,ax


mov ax, 4C00h
int 21h
code ends
end start