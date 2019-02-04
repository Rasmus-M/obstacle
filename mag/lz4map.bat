java -jar ..\tools\asm2bin.jar maps.a99 map1.bin MD1 MC2
..\tools\lz4.exe -9 -f map1.bin map1.lz4
..\tools\sfk.exe partcopy map1.lz4 -fromto 11 -8 map1trim.lz4 -yes
copy /Y map1trim.lz4 ..\src\

java -jar ..\tools\asm2bin.jar maps.a99 map2.bin MD2
..\tools\lz4.exe -9 -f map2.bin map2.lz4
..\tools\sfk.exe partcopy map2.lz4 -fromto 11 -8 map2trim.lz4 -yes
copy /Y map2trim.lz4 ..\src\
