
################################################################################
########                                                                ########
########        Makefile created by Arc-Pintade (Aurélien CARLE)        ########
########                                                                ########
########         Feel free to share this file for all beginners         ########
########               or anyone who don't want to waste                ########
########                 time with makefile creation ;)                 ########
########                                                                ########
################################################################################

#          here, libraries have been install with their natural path           #
#  To keep this structure give the same name as your mains to your executables #
#                                                                              #
#                                    Library                                   #
#                                   ROOT CERN                                  #
#                                     SFML                                     #
#                                     GTK+                                     #
#                                 Qt (no qmake)                                #
#                                                                              #
#                                   Thesaurus                                  #
#                           $@ : name of file target                           #
#                         $< : name of first dependency                        #
#                         $^ : name of all dependencies                        #

######################## Compiler variable definitions #########################

CC           = g++
CFLAGS       = -Wall

######################## Directory variable definitions ########################

Qt_INC_DIRS  =  -I/usr/include/qt4			$\
				-I/usr/include/qt4/QtCore	$\
				-I/usr/include/qt4/QtGui
SOURCES_DIR  = src
SCRIPTS_DIR  = scripts
BUILDS_DIR   = builds
BINARIES_DIR = bin

######################### Library variable definitions #########################

Qt_LIBS      = -lQtCore -lQtGui
GTK+_LIBS    = `pkg-config --cflags --libs gtk+-2.0`
ROOT_LIBS    = `root-config --cflags --glibs --ldflags`
SFML_LIBS    = -lsfml-graphics -lsfml-window -lsfml-system

########################## Intern variable definitions #########################

SOURCES      = $(shell ls ./$(SOURCES_DIR)/*.cpp)
SCRIPTS      = $(shell ls ./$(SCRIPTS_DIR)/*.cpp)
SOURCES_OBJ  = $(SOURCES:.cpp=.o)
SCRIPTS_OBJ  = $(SCRIPTS:.cpp=.o)
SCRIPTS_BIN  = $(SCRIPTS:.cpp=)

########################## Executable name definitions #########################

EXECUTABLE   = $(notdir $(SCRIPTS_BIN))

############################### Makefile commands ##############################

.PHONY: clean clean-all
all: $(EXECUTABLE)
	mv ./$(SCRIPTS_DIR)/*.o ./$(BUILDS_DIR)/
	mv ./$(SOURCES_DIR)/*.o ./$(BUILDS_DIR)/
	@echo "\n"\
	"*********************************\n"\
	"** La compilation est finie :) **\n"\
	"**   Woaaa quel codeur... <3   **\n"\
	"**  Atom > Vim > Rien > Emacs  **\n"\
	"*********************************\n"
clean:
	rm -f ./$(BUILDS_DIR)/*.o
clean-all:
	rm -f ./$(BUILDS_DIR)/*.o ./$(BINARIES_DIR)/*

############################### Objects creations ##############################

$(SCRIPTS_DIR)/%.o: $(SCRIPTS_DIR)/%.cpp
	$(CC) -c $(CFLAGS) $(Qt_INC_DIRS) $(Qt_LIBS) -o $@ $<
#	$(CC) -c $(CFLAGS) $(GTK+_LIBS) -o $@ $<
#	$(CC) -c $(CFLAGS) $(ROOT_LIBS) -o $@ $<
#	$(CC) -c $(CFLAGS) $(SFML_LIBS) -o $@ $<

$(SOURCES_DIR)/%.o: $(SOURCES_DIR)/%.cpp
	$(CC) -c $(CFLAGS) $(Qt_INC_DIRS) $(Qt_LIBS) -o $@ $<
#	$(CC) -c $(CFLAGS) $(GTK+_LIBS) -o $@ $<
#	$(CC) -c $(CFLAGS) $(ROOT_LIBS) -o $@ $<
#	$(CC) -c $(CFLAGS) $(SFML_LIBS) -o $@ $<

############################# Executables creations ############################

%: $(SCRIPTS_DIR)/%.o $(SOURCES_OBJ)
	$(CC) -o $(BINARIES_DIR)/$@ $^ $(Qt_LIBS)
#	$(CC) -o $(BINARIES_DIR)/$@ $^ $(GTK+_LIBS)
#	$(CC) -o $(BINARIES_DIR)/$@ $^ $(ROOT_LIBS)
#	$(CC) -o $(BINARIES_DIR)/$@ $^ $(SFML_LIBS)

#################################### Bye :) ####################################
