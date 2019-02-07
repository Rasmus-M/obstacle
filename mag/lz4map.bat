java -jar ..\tools\asm2bin.jar maps.a99 map0.bin MD1 MC2
..\tools\lz4.exe -9 -f map0.bin map0.lz4
..\tools\sfk.exe partcopy map0.lz4 -fromto 11 -8 map0trim.lz4 -yes
copy /Y map0trim.lz4 ..\src\

java -jar ..\tools\asm2bin.jar maps.a99 map1.bin MD2 MC3
..\tools\lz4.exe -9 -f map1.bin map1.lz4
..\tools\sfk.exe partcopy map1.lz4 -fromto 11 -8 map1trim.lz4 -yes
copy /Y map1trim.lz4 ..\src\

java -jar ..\tools\asm2bin.jar maps.a99 map2.bin MD3 MC4
..\tools\lz4.exe -9 -f map2.bin map2.lz4
..\tools\sfk.exe partcopy map2.lz4 -fromto 11 -8 map2trim.lz4 -yes
copy /Y map2trim.lz4 ..\src\

java -jar ..\tools\asm2bin.jar maps.a99 map3.bin MD4 MC5
..\tools\lz4.exe -9 -f map3.bin map3.lz4
..\tools\sfk.exe partcopy map3.lz4 -fromto 11 -8 map3trim.lz4 -yes
copy /Y map3trim.lz4 ..\src\

java -jar ..\tools\asm2bin.jar maps.a99 map4.bin MD5
..\tools\lz4.exe -9 -f map4.bin map4.lz4
..\tools\sfk.exe partcopy map4.lz4 -fromto 11 -8 map4trim.lz4 -yes
copy /Y map4trim.lz4 ..\src\
