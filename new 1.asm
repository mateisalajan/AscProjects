assume cs:code, ds:data
data SEGMENT

a dw 0111011101010111b
b dw 1001101110111110b
c db ?

data ENDS
code SEGMENT

start:
mov ax, data
mov ds, ax

mov bx, 0
mov ax, a ; izolam biti 7-9 ai lui a
and ax, 0000000111000000b
