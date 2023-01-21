;6.Se dau doua cuvinte A si B. 
;Sa se obtina un octet C care are pe bitii 0-4 bitii 11-15 ai cuvântului A,
;iar pe bitii 5-7 bitii 2-4 ai cuvântului B.

assume cs:code, ds:data
data SEGMENT

a dw 55cah
b dw 0f0fh
c db ?

data ENDS
code SEGMENT

start:
mov ax, data
mov ds, ax

mov bx, 0 ; vom calcula rezultatul in registrul bx

mov ax, a ; izolam bitii 11-15 ai lui a
and ax, 1111100000000000b
mov cl,11
ror ax,cl ; rotim 11 pozitii spre dreapta
or bx,ax ; punem bitii in rezultat

mov ax,b ; izolam bitii 2-4 ai lui b
and ax, 0000000000011100b
mov cl,3
rol ax,cl ; rotim 3 pozitii spre stanga
or bx,ax ; punem bitii in rezultat

mov c,bl

mov ax, 4c00h
int 21h
code ends
end start