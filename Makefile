CC = g++

CFLAGS = -Wall
MOC    = moc-qt4

Qt_INCDIRS = -I/usr/include/qt4 -I/usr/include/qt4/QtGui -I/usr/include/qt4/QtCore
Qt_LIBS    = -lQtCore -lQtGui
ROOT_LIBS  = `root-config --cflags --glibs --ldflags`
SFML_LIBS  = -lsfml-graphics -lsfml-window -lsfml-system

SOURCES    = $(shell ls ./src/*.cpp)
OBJECTS    = $(SOURCES:.cpp=.o)
EXECUTABLE = gregBiatch

.PHONY: clean clean-all
all: $(EXECUTABLE)
	@echo "\n"\
	"*********************************\n"\
	"** La compilation est finie :) **\n"\
	"**   Woaaa quel codeur... <3   **\n"\
	"**  Atom > Vim > Rien > Emacs  **\n"\
	"*********************************\n"
clean:
	rm -f ./src/*.o
clean-all:
	rm -f ./src/*.o bin/*

scripts/%.o: scripts/%.cpp
	$(CC) $(CFLAGS) $(Qt_INCDIRS) -c $(Qt_LIBS) -o $@ $<
#	$(CC) -c $(ROOT_LIBS) -o $@ $<
#	$(CC) -c $(SFML_LIBS) -o $@ $<

########## here the name of your main ##########
$(EXECUTABLE): scripts/essaie.o $(OBJECTS)
	$(CC) -o bin/$@ $^ $(Qt_LIBS)
#	$(CC) -o bin/$@ $^ $(ROOT_LIBS)
#	$(CC) -o bin/$@ $^ $(SFML_LIBS)
