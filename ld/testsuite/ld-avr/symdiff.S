/* Copyright (c) 2007, 2009  Dmitry Xmelkov
   Copyright (c) 2014 Embecosm
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

   * Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   * Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in
     the documentation and/or other materials provided with the
     distribution.
   * Neither the name of the copyright holders nor the names of
     contributors may be used to endorse or promote products derived
     from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.	*/

#define ZL r30
#define ZH r31
#define EERE	0
#define EEWE	1
#define addr_lo r24
#define addr_hi r25
#define _SFR_IO_ADDR(sfr) ((sfr) - __SFR_OFFSET)
#define NVM_BASE NVM_ADDR0

#define ret_lo	r24
#define	ret_hi	r25

eeprom_mapen:

	ldi	ZL, lo8(NVM_BASE)
	ldi	ZH, hi8(NVM_BASE)

	ldd	r19, Z + NVM_STATUS - NVM_BASE

	ldd	r19, Z + NVM_CTRLB - NVM_BASE
	std	Z + NVM_CTRLB - NVM_BASE, r19

	subi	ZL, lo8(-MAPPED_EEPROM_START)
	sbci	ZH, hi8(-MAPPED_EEPROM_START)

	sbic	_SFR_IO_ADDR (EECR), EEWE
	out	_SFR_IO_ADDR (EEARH), addr_hi
	out	_SFR_IO_ADDR (EEARL), addr_lo
	sbi	_SFR_IO_ADDR (EECR), EERE
	in	ret_lo, _SFR_IO_ADDR (EEDR)
