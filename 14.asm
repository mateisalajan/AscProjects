assume cs:code,ds:data
data segment
; aici vom declara datele
;zona de declaratii variab

sir db 'anaaremere$'


data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; incepand de aici vom scrie code

mov ah, 01h
int 21h

sub al, '0'

mov bl, al
add bl, 2 ; bl =5

;5 ->'5'

add bl, '0'


mov ah, 09h
mov dx, offset sir
int 21h

mov ah, 02h
mov dl, bl
int 21h






; marcaj de final program
mov ax, 4C00h
int 21h
code ends
end start