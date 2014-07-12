# 1 "symdiff.S"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "symdiff.S"
# 42 "symdiff.S"
eeprom_mapen:

 ldi r30, lo8(NVM_ADDR0)
 ldi r31, hi8(NVM_ADDR0)

 ldd r19, Z + NVM_STATUS - NVM_ADDR0

 ldd r19, Z + NVM_CTRLB - NVM_ADDR0
 std Z + NVM_CTRLB - NVM_ADDR0, r19

 subi r30, lo8(-MAPPED_EEPROM_START)
 sbci r31, hi8(-MAPPED_EEPROM_START)

 sbic ((EECR) - __SFR_OFFSET), 1
 out ((EEARH) - __SFR_OFFSET), r25
 out ((EEARL) - __SFR_OFFSET), r24
 sbi ((EECR) - __SFR_OFFSET), 0
 in r24, ((EEDR) - __SFR_OFFSET)
