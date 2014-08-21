#name: AVR Account for relaxation in label differences
#as: -mlink-relax
#ld: --relax
#source: relax.s
#objdump: -s
#target: avr-*-*

.*:     file format elf32-avr

Contents of section .text:
 0000 ffcf                                 .*
Contents of section .data:
 [0-9]* 0200                               .*

