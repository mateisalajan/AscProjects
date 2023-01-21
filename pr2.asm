;2.se citesc doua cuvinte A si B.sa se calculeze si sa afiseze
;in baza 2 cuvantuyl C format astfel.
;-bitii 0-3 au ca valoare 1101
;-bitii 4-8 coincid cu bitii 0-4 ai lui A
;-bitii 9-12 au valoarea 1
;-bitii 13-15 coincid cu bitii 7-9 ai lui B
;ex:
;A=42590
;B=15955
;C=1001111111101101
;0110010101110110

assume cs:code,ds:data
data segment
	a dw 42590
	b dw 15955
	c dw ?
data ends
code segment
start:
mov ax,data
mov ds,ax

mov bx,0

or bx,0000000000001101b

mov ax,a
and ax,0000000000011111b
mov cl,4
rol ax,cl
or bx,ax

or bx,0001111000000000b

mov ax,b
and ax,0000001110000000b
mov cl,6
rol ax,cl
or bx,ax

mov c,bx

mov ax,4c00h
int 21h
code ends
end start