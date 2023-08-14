DEST     =  dest
CXX      =  g++
CXXFLAGS =  -std=c++17 -Wall

ifdef DEBUG
CXXFLAGS += -g
else
CXXFLAGS += -O3
endif

LIB_O =  $(shell gfind lib -name '*.cpp' -printf './dest/%f.o ' | sed 's/.cpp//g')

build: prepare $(LIB_O) life

all: clean build bench

prepare:
	mkdir -p $(DEST)

./$(DEST)/%.o: lib/%.cpp defs.h lib/%.h
	$(CXX) $(CXXFLAGS) -c -o $@ $<

life: main.cpp defs.h $(LIB_O)
	$(CXX) $(CXXFLAGS) main.cpp -o life $(LIB_O)

bench: bench.cpp defs.h $(LIB_O)
	$(CXX) $(CXXFLAGS) bench.cpp -o ./$(DEST)/bench $(LIB_O)
	@echo "  ==> ./$(DEST)/bench will benchmark the simulation."
	@echo "  ==> Try \`time ./$(DEST)/bench\` or \`hyperfine ./$(DEST)/bench\`"

clean:
	rm -rf $(DEST) life life.dSYM
