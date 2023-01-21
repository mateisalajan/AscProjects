assume cs:code,ds:data
data segment

zonacit db 20, ?, 20 dup (?)
lens equ $-zonacit 
c db lens dup (?)
copie db ?
copie2 db ?
newline db 10,13, '$'

data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code
;incepere citire de la tastatura
mov ah,0ah
mov dx,offset zonacit
int 21h
;sfarsit citire de la tastatura
mov ah, 09h
mov dx, offset newline
int 21h
mov cl, byte ptr zonacit[1]; punem in cl lungimea sirului citit
mov ch,0; punem in ch 0 pentru a avea in cx lungimea sirului citit
mov si,2; incepem parcurgerea sirului de pe pozitia 2 deoarece pe 1 avem lungimea sirului
mov ax,0
mov di,0
mov copie2, 0
creare_sir:
    mov al, byte ptr zonacit[si]
    sub al,'0'
    mov copie,al
    mov ah, 0
    mov bl,2
    ;div bl
    ;cmp ah,0
        JNE adauga_sir
        JE next
    adauga_sir:
        mov bl,copie
        mov byte ptr c[di],bl
        add di,1
	add copie2, 1
    next:
        add si,1
loop creare_sir
    mov cl, copie2
    mov ch,0
    mov si,0
    afisare_sir:
        mov dl,byte ptr c[si]
        add dl,'0'
        mov ah,02h
        int 21h
        add si,1
    loop afisare_sir
; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start