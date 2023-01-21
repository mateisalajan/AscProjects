; Define the data segment
assume ds:data,cs:code
data segment
  array db 20 dup(?)  ; Array to store the input numbers
  len equ $-array
  n db ?               ; Number of elements in the array
  i db ?               ; Loop index
data ends

; Define the code segment
code segment
  start:
	mov ax,data
	mov ds,ax
    ; Input the array of numbers
    mov ah, 00h  ; Function 00h of interrupt 16h reads a character from the keyboard
    mov bh, 00h  ; Set the input mode to "echo"
    mov n, 0     ; Initialize the element count
	mov si,0

input_loop:
    int 16h      ; Read a character from the keyboard
    cmp al, 13   ; Check if the character is a newline
    je done      ; If it is, jump to the "done" label
    cmp al, ' '  ; Check if the character is a space
    je skip      ; If it is, skip it
    mov array[si], al  ; Store the character in the array
    inc si       ; Increment the element count
    jmp input_loop  ; Jump back to the beginning of the loop

skip:
    int 16h      ; Read the next character from the keyboard
    cmp al, 13   ; Check if the character is a newline
    je done      ; If it is, jump to the "done" label
    mov array[si], al  ; Store the character in the array
    inc si       ; Increment the element count
    jmp input_loop  ; Jump back to the beginning of the loop

done:
    ; Output the array of numbers
    mov ah, 02h  ; Function 02h of interrupt 29h writes a character to the screen
    mov di, 0     ; Initialize the loop index

output_loop:
    cmp di, len-1    ; Check if we reached the end of the array
    je sfarsit       ; If we did, jump to the "end" label
    mov dl, array[di]  ; Load the current element
    int 29h      ; Write it to the screen
    inc di      ; Increment the loop index
    jmp output_loop  ; Jump back to the beginning of the loop

sfarsit:
    ; Terminate the program
    mov ax, 4c00h  ; Function 4c00h terminates the program
    int 21h        ; Call interrupt 21h to terminate the program

code ends
end start
