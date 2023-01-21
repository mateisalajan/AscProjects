assume cs:code, ds:data
data segment
nr dw 1234h
data ends

code segment
start:

mov ax,data
mov ds,ax

mov ax, nr ; mutați numărul 1234h în registrul ax
aam ; convertiți numărul din baza 10 în baza 16
das ; afișați reprezentarea în baza 16 a numărului
mov ax, 4c00h
int 21h
code ends
end start

; Calculate circular permutations of digits in a 16-byte number

.MODEL SMALL
.STACK 100H

.DATA

NUMBER  DB 16 DUP(?)   ; 16-byte number

.CODE

MAIN PROC

MOV AX, @DATA         ; Set up data segment
MOV DS, AX

; Prompt user for 16-byte number

MOV AH, 9
MOV DX, OFFSET NUMBER
INT 21H

; Calculate circular permutations

; Your code here

; Display result to user

MOV AH, 9
MOV DX, OFFSET RESULT
INT 21H

MAIN ENDP

END
