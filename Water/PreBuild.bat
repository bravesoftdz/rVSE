@echo off
echo --Creating MemPak--
..\rVSE\Tools\MemPak\MemPak.exe MemPak.bin Data\*.*
brcc32 MemPak.rc
Pause