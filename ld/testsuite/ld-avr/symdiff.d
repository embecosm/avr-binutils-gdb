#source: symdiff.s
#ld: --defsym NVM_ADDR0=0x01C0 --defsym NVM_STATUS=0x01CF --defsym  NVM_CTRLB=0x01CC --defsym MAPPED_EEPROM_START=0x1000 --defsym EEARH=0x22 --defsym EECR=0x3F --defsym EEARL=0x21 --defsym EEDR=0x20 --defsym __SFR_OFFSET=0x20
#objdump: -d
#...
   0:	e0 ec       	ldi	r30, 0xC0	; 192
   2:	f1 e0       	ldi	r31, 0x01	; 1
   4:	37 85       	ldd	r19, Z\+15	; 0x0f
   6:	34 85       	ldd	r19, Z\+12	; 0x0c
   8:	34 87       	std	Z\+12, r19	; 0x0c
   a:	e0 50       	subi	r30, 0x00	; 0
   c:	f0 4f       	sbci	r31, 0xF0	; 240
   e:	f9 99       	sbic	0x1f, 1	; 31
  10:	92 b9       	out	0x02, r25	; 2
  12:	81 b9       	out	0x01, r24	; 1
  14:	f8 9a       	sbi	0x1f, 0	; 31
  16:	80 b1       	in	r24, 0x00	; 0
