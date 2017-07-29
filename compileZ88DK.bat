@REM set cc65path="C:\Retro\DEV\cc65-snapshot-win32"
@REM set mypath="C:\Users\Brizio\Documents\GitHub\PortableChase"
@REM set configpath="C:\Users\Brizio\Documents\GitHub\PortableChase\cfg"

@REM 
set cc65path="D:\personal\cc65-snapshot-win32"
@REM 
set configpath="D:\Userfiles\fcaruso\Documents\GitHub\ASCII-CHASE\cfg"
@REM 
set mypath="d:\Userfiles\fcaruso\Documents\GitHub\ASCII-CHASE"


set Deliverables=%mypath%\deliverables

mkdir %deliverables% 2> NUL

@REM del %deliverables%\*.prg
@REM del %deliverables%\*.bin
@REM del %deliverables%\*.xex
@REM del %deliverables%\*.tap
del %mypath%\*.o
del %mypath%\atmos\*.o
del %mypath%\c64\*.o
del %mypath%\patch\*.o

cd %cc65path%\bin\

@REM 
cd %mypath%\

@REM Working 64 column version without vertical outer wall - SLOW KEYBOARD INPUT with getk() but OK with in_Inkey()
@REM -DDEBUG_CHARACTERS
@REM 
@REM zcc +zx -vn -SO3 -DSPECTRUM_NATIVE_DIRECTIVES -DSPECTRUM_64COL -D__SPECTRUM__ -DAMALLOC -lmalloc -lndos -create-app -o %deliverables%\ZXSpectrum_64col_experimental.prg %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c
@REM del %deliverables%\ZXSpectrum_64col_experimental.prg


@REM Working 32 column version with vertical outer wall - SLOW KEYBOARD INPUT with getk() but OK with in_Inkey()
@REM -DDEBUG_EARLY_SKULL
@REM 
zcc +zx -vn -SO3  -DSPECTRUM_NATIVE_DIRECTIVES -DSPECTRUM_32COL -D__SPECTRUM__ -DAMALLOC -lmalloc -lndos -create-app -o %deliverables%\ZXSpectrum_32col_experimental.prg %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c
@REM 
del %deliverables%\ZXSpectrum_32col_experimental.prg

@REM WORKING but with problematic input and not outer wall - FAST KEYBOARD INPUT
@REM optimize with:  -SO3 --max-allocs-per-node200000
@REM 
@REM 
zcc +zx -SO3 -startup=1 -clib=sdcc_iy -vn  -DSPECTRUM_32COL -D__SPECTRUM__ -DAMALLOC -create-app -o %deliverables%\ZXSpectrum_32col_sdcc_experimental.prg %mypath%\sleep_macros.c %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c
@REM 
del %deliverables%\ZXSpectrum_32col_sdcc_experimental.prg
@REM 
del %deliverables%\ZXSpectrum_32col_sdcc_experimental_CODE.bin


@REM WORKING but with problematic input and not outer wall - FAST KEYBOARD INPUT
@REM optimize with:  -SO3 --max-allocs-per-node200000
@REM 
@REM zcc +zx  -SO3 -startup=5 -clib=sdcc_iy -vn  -DSPECTRUM_64COL -D__SPECTRUM__ -DAMALLOC -create-app -o %deliverables%\ZXSpectrum_64col_sdcc_experimental.prg %mypath%\sleep_macros.c %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c
@REM del %deliverables%\ZXSpectrum_64col_sdcc_experimental.prg
@REM 
@REM del %deliverables%\ZXSpectrum_64col_sdcc_experimental_CODE.bin







@REM ----------------------------------------------------------------------------------------------------------------------------------------------------
@REM NON_WORKING




@REM zcc +msx -vn  -DSPECTRUM_NATIVE_DIRECTIVES -DSPECTRUM_32COL -D__SPECTRUM__ -DAMALLOC -lmalloc -lndos -create-app -o %deliverables%\msx_32col_experimental.prg %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c
@REM del %deliverables%\msx_32col_experimental.prg

@REM 
@REM zcc +cpc -vn  -subtype=wav -DDEBUG_CHARACTERS -DSPECTRUM_NATIVE_DIRECTIVES -DSPECTRUM_32COL -D__SPECTRUM__ -DAMALLOC -lmalloc -lndos -create-app -o %deliverables%\cpc_32col_experimental.prg %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c
@REM del %deliverables%\cpc_32col_experimental.prg




@REM 
@REM not working because of missing dependencies
@REM zcc +cpc -startup=1 -clib=sdcc_iy -vn  -DDEBUG_CHARACTERS  -DSPECTRUM_32COL -D__SPECTRUM__ -DAMALLOC -create-app -o %deliverables%\cpc_32col_sdcc_experimental.prg %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c
@REM zcc +msx -startup=1 -clib=sdcc_iy -vn  -DDEBUG_CHARACTERS  -DSPECTRUM_32COL -D__SPECTRUM__ -DAMALLOC -create-app -o %deliverables%\msx_32col_sdcc_experimental.prg %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c
@REM zcc +sms -startup=1 -clib=sdcc_iy -vn  -DDEBUG_CHARACTERS  -DSPECTRUM_32COL -D__SPECTRUM__ -DAMALLOC -create-app -o %deliverables%\sms_32col_sdcc_experimental.prg %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c
@REM zcc +z80 -startup=1 -clib=sdcc_iy -vn  -DDEBUG_CHARACTERS  -DSPECTRUM_32COL -D__SPECTRUM__ -DAMALLOC -create-app -o %deliverables%\z80_32col_sdcc_experimental.prg %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c
@REM zcc +cpm -startup=1 -clib=sdcc_iy -vn  -DDEBUG_CHARACTERS  -DSPECTRUM_32COL -D__SPECTRUM__ -DAMALLOC -create-app -o %deliverables%\cpm_32col_sdcc_experimental.prg %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c



@REM zcc +msx -vn -DDEBUG_CHARACTERS -D__MSX__ -DAMALLOC -lmalloc -lndos -create-app -o %deliverables%\msx.prg %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c
@REM del %deliverables%\msx.prg

@REM zcc +cpc -subtype=wav -vn -DDEBUG_CHARACTERS -D__CPC__ -DAMALLOC -lmalloc -lndos -create-app -o %deliverables%\cpc.prg %mypath%\display_macros.c %mypath%\powerUps.c %mypath%\enemy.c %mypath%\invincible_enemy.c %mypath%\level.c %mypath%\character.c %mypath%\text.c %mypath%\missile.c %mypath%\strategy.c %mypath%\input.c %mypath%\main.c
@REM del %deliverables%\cpc.prg


@REM ANSI 
@REM WORKING: Hello world
@REM zcc +zx -startup=5 -clib=sdcc_iy -vn  -DAMALLOC  -create-app -o %deliverables%\hello64.prg my_hello.c
@REM zcc +zx -startup=1 -clib=sdcc_iy -vn  -DAMALLOC  -create-app -o %deliverables%\hello32.prg my_hello.c

@REM pragma recognized but NOT the coordinates because the code should use real VT100/ANSI directives
@REM zcc +zx -clib=ansi -pragma-define:ansicolumns=32 -lmalloc -lndos -vn -DAMALLOC  -create-app -o %deliverables%\helloANSI32.prg hello.c
@REM zcc +zx -clib=ansi -pragma-define:ansicolumns=64 -lmalloc -lndos -vn -DAMALLOC  -create-app -o %deliverables%\helloANSI64.prg hello.c

REM zcc +msx -vn -DAMALLOC -lmalloc -lndos -create-app -o %deliverables%\msxhello.prg my_hello.c
REM zcc +cpc -subtype=wav -vn -DAMALLOC -lmalloc -lndos -create-app -o %deliverables%\cpchello.prg cpc_hello.c



del %mypath%\*.o
del %mypath%\atmos\*.o
del %mypath%\c64\*.o
del %mypath%\patch\*.o
