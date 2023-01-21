assume cs:code,ds:data
data segment
input db 15 dup(?)
data ends

; marcaj inceput program
code segment
start:
mov ax,data
mov ds,ax
; Prompt the user to enter numbers separated by spaces
mov ah, 09h
mov dx, offset prompt
int 21h

; Read the input from the user
mov ah, 0ah
mov dx, offset input
int 21h

; Parse the input and store the numbers in an array
mov si, offset input ; Initialize the string pointer
mov di, offset array  ; Initialize the array pointer
mov cx, 0             ; Initialize the array index

parse_loop:
    ; Read the next character from the input string
    mov al, [si]
    inc si

    ; Check if the character is a space or a null terminator
    cmp al, ' '
    je increment_index
    cmp al, 0
    je done

    ; Convert the character to a number and store it in the array
    sub al, '0'
    mov [di+cx], al
    jmp parse_loop

increment_index:
    ; Increment the array index
    inc cx
    jmp parse_loop

done:
    ; Output the array to the console
    mov ah, 09h
    mov dx, offset array
    int 21h

mov ax,4c00h
int 21h
code ends
end start