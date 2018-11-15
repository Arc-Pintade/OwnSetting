
if [ $# -lt 1 ]
then 
    echo "nique ta mère !"
else
    mkdir src
    mkdir include
    mkdir data
    mkdir results
    touch src/main.cpp
    touch src/$1.cpp
    touch include/$1.hpp
    touch Makefile

#_____________ remplissage Makefile _______________#
    echo "CC = g++
ROOT = \`root-config --cflags --glibs --ldflags\`
SRC=\$(shell ls ./src/*.cpp)
OBJ=\$(SRC:.cpp=.o)
.PHONY: clean
.PHONY: clean-all
all: $1
clean:
	rm -f ./src/*.o
clean-all:
	rm -f ./src/*.o $1
%.o: %.cpp
	\$(CC) -c \$(ROOT) -o \$@ \$<
$1: \$(OBJ) 
	\$(CC) \$(ROOT) -o \$@ $^ " > Makefile

#______________ remplissage main.cpp _______________#
    echo "#include \"../include/$1.hpp\"

#include <iostream>

using namespace std;

int main (){

    cout<<\"Hello World !\"<<endl;

    return 0;
}" > src/main.cpp

#_______________ remplissage .hpp _________________#
    echo "#ifndef $1_h
#define $1_h

#include <TString.h>

#endif
" > include/$1.hpp

#_______________remplissage .cpp _________________#
    echo "#include \"../include/$1.hpp\"

#include <TCanvas.h>
#include <TH1F.h>
#include <TLegend.h>
#include <TString.h>

" > src/$1.cpp

fi


