/* --------------------------------------------------------------------------------------- */ 
// 
// CROSS CHASE by Fabrizio Caruso
//
// Fabrizio_Caruso@hotmail.com
//
// This software is provided 'as-is', without any express or implied warranty.
// In no event will the authors be held liable for any damages arising from
// the use of this software.

// Permission is granted to anyone to use this software for non-commercial applications, 
// subject to the following restrictions:

// 1. The origin of this software must not be misrepresented; you must not
// claim that you wrote the original software. If you use this software in
// a product, an acknowledgment in the product documentation would be
// appreciated but is not required.

// 2. Altered source versions must be plainly marked as such, and must not
// be misrepresented as being the original software.

// 3. This notice may not be removed or altered from any source distribution.
/* --------------------------------------------------------------------------------------- */ 

#include <conio.h>
#include <peekpoke.h>
#include <atari.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "graphics_settings.h"

#include "8x8_chars.h"

#define GRAPHICS_MODE_1 (1+16)

#include "udg_map.h"	

#if defined(REDEFINED_CHARS)
void set_udg(void)
{
	uint8_t *_CHBAS = (uint8_t *) 0x2F4;
	extern char _FONT_START__[];	

	memcpy(_FONT_START__, (void *)0xE000, 512);
	
	/* modify your font at _FONT_START__, etc, then set the new font: */
	REDEFINE_AT(_FONT_START__);
	
	*_CHBAS = ((int)_FONT_START__ >> 8);  /* enable the new font */
}
#endif

uint16_t BASE_ADDR;
    
void INIT_GRAPHICS(void)
{
	// Mode 12 with no last monochromatic lines (12+16)
	_graphics(GRAPHICS_MODE_1);
	
	_setcolor_low(0, TGI_COLOR_RED);
	_setcolor_low(1, TGI_COLOR_WHITE);
	_setcolor_low(2, TGI_COLOR_CYAN); 	
	_setcolor_low(3, TGI_COLOR_BROWN);
	_setcolor_low(4, TGI_COLOR_BLACK);

	#if defined(REDEFINED_CHARS)
	set_udg();
	#endif
    
    BASE_ADDR = BASE_ADDR_VALUE;

}


