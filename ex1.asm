; Sa se evalueze expresia a*b+c

; am considerat a si b ca fiind octeti iar c cuvant, rezultatul tinandu-l in rez , si acesta cuvant.

ASSUME cs:text_,ds:data_

data_ SEGMENT
a dw 1000
b dw 2000
c dw 123
rez dw ?
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei
mov ax, a ; al = a
mul b ; ax = a*b

; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start