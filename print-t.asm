assume cs:code, ds:data
data segment
  msg db 'Test print in assembly','$'
data ends

code segment
start:
  mov ax, data
  mov ds, ax
  
  lea dx,msg
  mov ah,09h
  int 21h
  
mov ax, 4c00h ; terminam programul
int 21h
code ends
end start