assume cs:code, ds:data
data SEGMENT

a db 4
b db 7
z dw ?


data ENDS
code SEGMENT

;z=(5*a-b/7)/(3/b+a*a)
start:
mov ax, data
mov ds, ax

;prima paranteza

mov al, 5
mov ah, 0
mul a
mov bx, ax

mov al,b
mov ah,0
mov bl, 7
div bl
mov cl,al
mov ch,0
sub bx, cx
mov z, bx

;a doua paranteza

mov al, 3
mov ah, 0
div b
mov cl, al
mov ch, 0
mov bx, cx

mov al,a
mov ah,0
mul a ; in ax = a*a
add bx, ax

mov ax, z
mov dx, 0
div bx