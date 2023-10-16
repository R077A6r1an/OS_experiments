bits 32
global _start

extern _binary_Loadfile_bin_start
extern _binary_Loadfile_bin_end

section .text
  align 4
  dd 0x1BADB002                ; magic
  dd 0x00                      ; flags
  dd - (0x1BADB002 + 0x00)     ; checksum

_start:
  cli
  mov esp, stack
  
  ; OK, now load all to get it start
  mov eax, _binary_Loadfile_bin_start
  mov ebx, _binary_Loadfile_bin_end
  
  ; Now copy these flat binaries to the expected load address at 0xFFFFFF
  mov ecx, 0xFFFFFF
.loop_begin:
  mov edx, dword[eax]
  mov dword[ecx], edx
  add ecx, 4
  add eax, 4
  sub ebx, 4
  
  cmp ebx, 0
  js .next
  
  cmp ebx, 0
  je .next
  
  jmp .loop_begin

.next:
  ; expecting in eax the address to jump to the new loaded file
  mov eax, 0xFFFFFF
  mov ebx, continu
  jmp eax

continu:
  
  mov eax, 0xb8000
  mov byte[eax+10], ' '
  mov byte[eax+11], 0x0A
  mov byte[eax+12], 'O'
  mov byte[eax+13], 0x0A
  mov byte[eax+14], 'K'
  mov byte[eax+15], 0x0A
  
  ; expecting never return
  cli
  hlt

section .bss
resb 32768
stack:
