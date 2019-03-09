cd maps
call lz4map.bat
cd ..

xas99.py -R -S -L obstacle-course.lst -b src/obstacle-course.a99
@IF %ERRORLEVEL% NEQ 0 GOTO :end

copy /b obstacle-course_6000.bin + obstacle-course_*_b0.bin obstacle-course_b0.bin
copy /b obstacle-course_6000.bin + obstacle-course_*_b1.bin obstacle-course_b1.bin

del obstacle-course_6000.bin
del obstacle-course_*_b0.bin
del obstacle-course_*_b1.bin

tools\pad.exe obstacle-course_b0.bin obstacle-c.bin 8192
tools\pad.exe obstacle-course_b1.bin obstacle-d.bin 8192

rem del obstacle-course_b0.bin
rem del obstacle-course_b1.bin

copy /b obstacle-c.bin + obstacle-d.bin obstacle-9.bin
copy /b obstacle-d.bin + obstacle-c.bin obstacle-8.bin

WHERE jar
@IF %ERRORLEVEL% NEQ 0 GOTO :end
jar -cvf obstacle.rpk obstacle-8.bin layout.xml > make.log

:end
