IF EXIST obstacle.dsk GOTO :dskok
xdm99.py obstacle.dsk --initialize DSSD -n OBSTACLE
:dskok

xas99.py -R -S -q -L obstacle-disk.lst -D disk -i src/obstacle-course-disk.a99 -o OBSTACLE1

xdm99.py obstacle.dsk -a LOAD
xdm99.py obstacle.dsk -a OBSTACLE1
xdm99.py obstacle.dsk -a OBSTACLE2
