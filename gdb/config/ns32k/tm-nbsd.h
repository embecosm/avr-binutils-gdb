/* Macro definitions for ns32k running under NetBSD.
   Copyright 1986, 1987, 1989, 1991, 1992, 1993, 1994
   Free Software Foundation, Inc.

   This file is part of GDB.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA.  */

#ifndef TM_NBSD_H
#define TM_NBSD_H

/* Override number of expected traps from sysv. */
#define START_INFERIOR_TRAPS_EXPECTED 2

/* Most definitions from umax could be used. */

#include "ns32k/tm-umax.h"

/* Return non-zero if we are in a shared library trampoline code stub. */
#define IN_SOLIB_CALL_TRAMPOLINE(pc, name) \
  (name && !strcmp(name, "_DYNAMIC"))

/* Saved Pc.  Get it from sigcontext if within sigtramp.  */

/* Offset to saved PC in sigcontext, from <machine/signal.h>.  */
#define SIGCONTEXT_PC_OFFSET 20

/* tm-umax.h assumes a 32082 fpu. We have a 32382 fpu. */

#undef REGISTER_NAME
#define REGISTER_NAME(REGNUM) ns32k_register_name_32382((REGNUM))

#undef NUM_REGS
#define NUM_REGS		29

/* Total amount of space needed to store our copies of the machine's
   register state, the array `registers'.  */
#undef REGISTER_BYTES
#define REGISTER_BYTES \
  ((NUM_REGS - 4) * REGISTER_RAW_SIZE(R0_REGNUM) \
   + 8            * REGISTER_RAW_SIZE(LP0_REGNUM))

#undef  REGISTER_BYTE
#define REGISTER_BYTE(N) ns32k_register_byte_32382 ((N))

#endif /* TM_NBSD_H */
