#!/bin/sh
rm -rf *.h *.i *.cpp *.cu *.cxx dist trottersuzuki.egg* build trottersuzuki.py *.so
cp ../*.h .
cp ../*.i .
cp ../*.cpp .
cp ../*.cu .
swig -c++ -python trotter.i
python2 setup.py build_ext --inplace
