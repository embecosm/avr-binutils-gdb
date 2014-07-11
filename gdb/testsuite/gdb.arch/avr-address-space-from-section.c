/* This testcase is part of GDB, the GNU debugger.

   Copyright 2014 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

#ifdef __FLASH
const __flash char data_in_flash = 0xab;
#else
const char data_in_flash __attribute__((__progmem__)) = 0xab;
#endif

const char data_in_eeprom __attribute__((section(".eeprom"))) = 0xcd;

int
main (void)
{
  return 0;
}
