assume cs:code, ds:data
data SEGMENT

a db 5
b db 6
c db 3
d db 4
z dw ?


data ENDS
code SEGMENT

;z=(a+b+c+1)^3/(a-b*c+d)

start:
mov ax,data
mov ds,ax

mov al,a
mov ah,0
add ax,b ;ax = a+b
add ax,c ;ax = a+b+c
add ax,1 ;ax = a+b+c+1
mov bl,ax
