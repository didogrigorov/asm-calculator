; Simple NASM calculator for addition, subtraction, multiplication, and division
; Works on Linux x86_64
section .data
    prompt_op db 'Enter operation (1 for add, 2 for sub, 3 for mul, 4 for div): ', 0
    prompt1 db 'Enter first number: ', 0
    prompt2 db 'Enter second number: ', 0
    result db 'Result: %d', 10, 0
    error_div_zero db 'Error: Division by zero!', 10, 0
    format db '%d', 0

section .bss
    operation resq 1
    num1 resq 1
    num2 resq 1

section .text
    extern printf
    extern scanf
    global main

main:
    ; Save registers
    push rbp
    mov rbp, rsp

    ; Prompt for operation
    mov rdi, prompt_op
    xor rax, rax
    call printf

    ; Read operation (1 for add, 2 for sub, 3 for mul, 4 for div)
    mov rdi, format
    mov rsi, operation
    xor rax, rax
    call scanf

    ; Prompt for first number
    mov rdi, prompt1
    xor rax, rax
    call printf

    ; Read first number
    mov rdi, format
    mov rsi, num1
    xor rax, rax
    call scanf

    ; Prompt for second number
    mov rdi, prompt2
    xor rax, rax
    call printf

    ; Read second number
    mov rdi, format
    mov rsi, num2
    xor rax, rax
    call scanf

    ; Load numbers
    mov rax, [num1]
    mov rbx, [num2]

    ; Check operation
    cmp qword [operation], 1
    je .add
    cmp qword [operation], 2
    je .subtract
    cmp qword [operation], 3
    je .multiply
    cmp qword [operation], 4
    je .divide
    jmp .end ; Invalid operation, skip to end

.add:
    add rax, rbx
    jmp .print_result

.subtract:
    sub rax, rbx
    jmp .print_result

.multiply:
    imul rax, rbx
    jmp .print_result

.divide:
    ; Check for division by zero
    cmp rbx, 0
    je .div_zero
    ; Sign-extend rax into rdx:rax for division
    cqo
    idiv rbx
    jmp .print_result

.div_zero:
    mov rdi, error_div_zero
    xor rax, rax
    call printf
    jmp .end

.print_result:
    ; Print result
    mov rdi, result
    mov rsi, rax
    xor rax, rax
    call printf

.end:
    ; Restore registers and return
    mov rsp, rbp
    pop rbp
    xor rax, rax
    ret
