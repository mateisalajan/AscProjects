.MODEL SMALL
.STACK 100H

.DATA
    prompt1 DB 'Enter n: $'
    buffer DB 6 DUP (?)
    fib DB 6 DUP (?)

.CODE

start:
    mov ax, @data
    mov ds, ax

    ; Print the prompt
    mov ah, 09h
    mov dx, offset prompt1
    int 21h

    ; Read the user's input
    mov ah, 0ah
    mov dx, offset buffer
    int 21h

    ; Convert the input string to a number
    mov bx, 0
    mov cx, 0
    mov si, offset buffer
    mov bl, [si]

convert_loop:
    cmp bl, '0'
    jl input_error
    cmp bl, '9'
    jg input_error

    sub bl, '0'
    imul bx, 10
    add bx, ax

    inc si
    mov bl, [si]
    cmp bl, '$'
    jne convert_loop
    jmp calc_fib

    ; Handle invalid input
input_error:
    mov ah, 09h
    mov dx, offset invalid_input
    int 21h
    jmp start

calc_fib:
    ; Calculate the first n elements of the Fibonacci sequence
    mov [fib], 1
    mov [fib+2], 1
    mov cx, bx
    dec cx
    mov di, 4

calc_loop:
    mov ax, [fib+di-2]
    add ax, [fib+di]
    mov [fib+di+2], ax
    add di, 2
    loop calc_loop

    ; Print the first n elements of the Fibonacci sequence
    mov ah, 09h
    mov dx, offset fib
    int 21h

    ; Exit the program
    mov ah, 4ch
    int 21h

.END
