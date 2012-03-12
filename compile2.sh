cd build
rm peri7.o libperi.h.gch
g++ -c -fopenmp -O2 -g -I/usr/local/include/vtk-5.4 ../src/libperi.h ../src/peri7.cpp -Wl,-Bstatic -L/usr/local/lib/vtk-5.4 -Wl,-Bdynamic -lm -lpthread -lm -Wno-deprecated
 
echo "compilation completed"
g++ -fopenmp -o peri_mp peri7.o -Wl,-Bstatic -L/usr/local/lib/vtk-5.4 \
-lvtkWidgets -lvtkRendering -lvtkImaging -lvtkGraphics -lvtkFiltering \
       -lvtkGenericFiltering -lvtkHybrid -lvtkIO -lvtkftgl -lvtkVolumeRendering -lvtkNetCDF \
       -lvtkDICOMParser -lvtkCommon -lvtkexoIIc  -lvtksys -lvtkzlib \
-Wl,-Bdynamic -lGL -lGLU -lX11 -lXmu -lXi -lm -lpthread -lm -Wno-deprecated 
mv ../src/libperi.h.gch .

