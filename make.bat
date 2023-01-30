cd maps
call lz4map.bat
cd ..

java -jar tools\asm2bin.jar src/sprite-patterns.a99 sprite-patterns.bin
tools\lz4.exe -9 -f sprite-patterns.bin sprite-patterns.lz4
tools\sfk.exe partcopy sprite-patterns.lz4 -fromto 11 -8 src\sprite-patterns.lz4 -yes

del sprite-patterns.bin
del sprite-patterns.lz4

xas99.py -R -S -q -L obstacle-course.lst -b src/obstacle-course.a99
@IF %ERRORLEVEL% NEQ 0 GOTO :end

tools\pad.exe obstacle-course_b0.bin obstacle-d.bin 8192
tools\pad.exe obstacle-course_b1.bin obstacle-c.bin 8192

del obstacle-course_b0.bin
del obstacle-course_b1.bin

copy /b obstacle-d.bin + obstacle-c.bin obstacle-9.bin
copy /b obstacle-c.bin + obstacle-d.bin obstacle-8.bin

WHERE jar
@IF %ERRORLEVEL% NEQ 0 GOTO :end
jar -cvf obstacle.rpk obstacle-8.bin layout.xml > make.log

:end
