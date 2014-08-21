#name: AVR No change in behavior without relaxation
#source: relax.s
#objdump: -s
#target: avr-*-*

.*:     file format elf32-avr

Contents of section .text:
 0000 0c940000                             .*
Contents of section .data:
 [0-9]* 0400                               .* 
