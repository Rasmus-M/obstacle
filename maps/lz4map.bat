java -jar ..\tools\asm2bin.jar maps.a99 map0.bin MD1 MC2
..\tools\lz4.exe -9 -f map0.bin map0.lz4
..\tools\sfk.exe partcopy map0.lz4 -fromto 11 -8 map0trim.lz4 -yes
copy /Y map0trim.lz4 ..\src\maps\

java -jar ..\tools\asm2bin.jar maps.a99 map1.bin MD2 MC3
..\tools\lz4.exe -9 -f map1.bin map1.lz4
..\tools\sfk.exe partcopy map1.lz4 -fromto 11 -8 map1trim.lz4 -yes
copy /Y map1trim.lz4 ..\src\maps\

java -jar ..\tools\asm2bin.jar maps.a99 map2.bin MD3 MC4
..\tools\lz4.exe -9 -f map2.bin map2.lz4
..\tools\sfk.exe partcopy map2.lz4 -fromto 11 -8 map2trim.lz4 -yes
copy /Y map2trim.lz4 ..\src\maps\

java -jar ..\tools\asm2bin.jar maps.a99 map3.bin MD4 MC5
..\tools\lz4.exe -9 -f map3.bin map3.lz4
..\tools\sfk.exe partcopy map3.lz4 -fromto 11 -8 map3trim.lz4 -yes
copy /Y map3trim.lz4 ..\src\maps\

java -jar ..\tools\asm2bin.jar maps.a99 map4.bin MD5 MC6
..\tools\lz4.exe -9 -f map4.bin map4.lz4
..\tools\sfk.exe partcopy map4.lz4 -fromto 11 -8 map4trim.lz4 -yes
copy /Y map4trim.lz4 ..\src\maps\

java -jar ..\tools\asm2bin.jar maps.a99 map5.bin MD6 MC7
..\tools\lz4.exe -9 -f map5.bin map5.lz4
..\tools\sfk.exe partcopy map5.lz4 -fromto 11 -8 map5trim.lz4 -yes
copy /Y map5trim.lz4 ..\src\maps\

java -jar ..\tools\asm2bin.jar maps.a99 map6.bin MD7 MC8
..\tools\lz4.exe -9 -f map6.bin map6.lz4
..\tools\sfk.exe partcopy map6.lz4 -fromto 11 -8 map6trim.lz4 -yes
copy /Y map6trim.lz4 ..\src\maps\

java -jar ..\tools\asm2bin.jar maps.a99 map7.bin MD8 MC9
..\tools\lz4.exe -9 -f map7.bin map7.lz4
..\tools\sfk.exe partcopy map7.lz4 -fromto 11 -8 map7trim.lz4 -yes
copy /Y map7trim.lz4 ..\src\maps\

java -jar ..\tools\asm2bin.jar maps.a99 map8.bin MD9
..\tools\lz4.exe -9 -f map8.bin map8.lz4
..\tools\sfk.exe partcopy map8.lz4 -fromto 11 -8 map8trim.lz4 -yes
copy /Y map8trim.lz4 ..\src\maps\
