CC           = g++
CFLAGS       = -Wall
MOC          = moc-qt4

######################## Directory variable definitions ########################

Qt_INC_DIRS  = -I/usr/include/qt4 -I/usr/include/qt4/QtGui -I/usr/include/qt4/QtCore
SOURCES_DIR  = src
SCRIPTS_DIR  = scripts

######################### Library variable definitions #########################

Qt_LIBS      = -lQtCore -lQtGui
ROOT_LIBS    = `root-config --cflags --glibs --ldflags`
SFML_LIBS    = -lsfml-graphics -lsfml-window -lsfml-system

########################## Intern variable definitions #########################

SOURCES      = $(shell ls ./$(SOURCES_DIR)/*.cpp)
SCRIPTS      = $(shell ls ./$(SCRIPTS_DIR)/*.cpp)
OBJECTS      = $(SOURCES:.cpp=.o)
SCRIPTS_OBJ  = $(SCRIPTS:.cpp=.o)

########################## Executable name definitions #########################

EXEC_1       = essaie
EXEC_2       = essaie2

############################### Makefile commands ##############################

.PHONY: clean clean-all
all: $(EXEC_1) $(EXEC_2)
	@echo "\n"\
	"*********************************\n"\
	"** La compilation est finie :) **\n"\
	"**   Woaaa quel codeur... <3   **\n"\
	"**  Atom > Vim > Rien > Emacs  **\n"\
	"*********************************\n"
clean:
	rm -f ./$(SOURCES_DIR)/*.o ./$(SCRIPTS_DIR)/*.o
clean-all:
	rm -f ./$(SOURCES_DIR)/*.o ./$(SCRIPTS_DIR)/*.o bin/*

############################### Objects creations ##############################

$(SCRIPTS_DIR)/%.o: $(SCRIPTS_DIR)/%.cpp
	$(CC) $(CFLAGS) $(Qt_INC_DIRS) -c $(Qt_LIBS) -o $@ $<
#	$(CC) -c $(ROOT_LIBS) -o $@ $<
#	$(CC) -c $(SFML_LIBS) -o $@ $<

############################# Executables creations ############################

$(EXEC_1): $(SCRIPTS_DIR)/$(EXEC_1).o $(OBJECTS)
	$(CC) -o bin/$@ $^ $(Qt_LIBS)
#	$(CC) -o bin/$@ $^ $(ROOT_LIBS)
#	$(CC) -o bin/$@ $^ $(SFML_LIBS)

$(EXEC_2): $(SCRIPTS_DIR)/$(EXEC_2).o $(OBJECTS)
	$(CC) -o bin/$@ $^ $(Qt_LIBS)
#	$(CC) -o bin/$@ $^ $(ROOT_LIBS)
#	$(CC) -o bin/$@ $^ $(SFML_LIBS)
