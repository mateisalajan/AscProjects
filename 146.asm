; Sa se citeasca de la tastatura un sir de numere in baza 10.
; Sa se afiseze sirul citit.
; s = 123 4567 789 10 1
;=> d = 123 4567 789 10 1
;!!!!!!!!! atentie sa introduceti separatorul

assume cs:code, ds:data
data segment

;alocare spatiu pentru sirul care se va citi: s
s db 10, ?, 10 dup(?)
;alocare spatiu pentru sirul care va stoca numerele citite si pe care il vom printa
d dw 10 dup (?)
lens dw ?
; definire separator
;atentie dupa ultimul numar mai trebuie introdus un separator
sep db ' '; spatiu
;definire newline
newline db 10, 13, '$'
zeceb db 10
zecew dw 10
aux dw ?

data ends
code segment

afisare_numar proc
mov cx,0
repeta2:
	mov dx,0
	div zecew
	push dx
	inc cx
	cmp ax,0
JNE repeta2

afisare:
	pop dx
	add dl,'0'
	mov ah,02h
	int 21h
loop afisare
ret
afisare_numar endp

start:
mov ax,data
mov ds,ax

;citire sir de la tastatura
mov ah, 0ah
mov dx, offset s
int 21h

;identificare lungime efectiva sir citit
mov bl, byte ptr s[1]
mov bh, 0
mov lens, bx ; lungimea efectiva
add lens, 2 ; pentru a se prelucra si ultimul separator s

;accesare caracterele citite, formare numar si salvare in d
mov si, 2 ; de la adresa 2 incepe spatiu alocat pt s
;unde se afla efectiv elementele
mov di, 0; pentru sir d


prelucraresir:
    mov ax,0
    repeta:
        mul zeceb
        mov bl, byte ptr s[si]
        sub bl, '0'
        mov bh, 0
        add ax, bx
        inc si
        mov bl, byte ptr s[si]
        cmp sep, bl
        JE adaugainD
        JNE repeta
        
            adaugainD:
                mov d[di], ax
                add di, 2
                inc si
cmp si, lens
JE afisareD
JNE prelucraresir

afisareD:
; trecem pe linie noua
mov ah,09h
mov dx,offset newline
int 21h

mov aux, di
mov di, 0
repetaafis:
    mov ax, d[di]
    call afisare_numar
    mov dl, ' '
    mov ah, 02h
    int 21h
    add di, 2
    cmp di, aux
    JNE repetaafis
    
    mov ax,4c00h
int 21h
code ends
end start
                
        