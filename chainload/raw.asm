org 0xFFFFFF
bits 32

_start:
  ; OK, now write something in the VGA
  mov eax, 0xb8000
  mov byte[eax], 'H'
  mov byte[eax+1], 0x04
  mov byte[eax+2], 'a'
  mov byte[eax+3], 0x04
  mov byte[eax+4], 'l'
  mov byte[eax+5], 0x04
  mov byte[eax+6], 'l'
  mov byte[eax+7], 0x04
  mov byte[eax+8], 'o'
  mov byte[eax+9], 0x04
  
  jmp ebx
