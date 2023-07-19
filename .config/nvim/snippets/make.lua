return {
  s(
    '!',
    fmt(
      [[
CXX      = gcc
CXXFLAGS = -std=c++17 -Wall
DEST     = dest
LIB_O    = $(shell find lib -name '*.cpp' -printf './dest/%f.o ' | sed 's/.cpp//g')

ifdef DEBUG
CXXFLAGS += -g
else
CXXFLAGS += -O3
endif

build: prepare $(LIB_O) {program_name}

all: clean build

prepare:
	mkdir -p $(DEST)

./$(DEST)/%.o: lib/%.cpp lib/%.h
	$(CXX) $(CXXFLAGS) -c -o $@ $<

{program_name}: {main_file} $(LIB_O)
	$(CXX) $(CXXFLAGS) {main_file} -o {program_name} $(LIB_O)

clean:
	rm -rf $(DEST) {program_name} {program_name}.dSYM

]],
      {
        program_name = i(1, 'my_program'),
        main_file = i(2, 'main.cpp'),
      },
      {
        delimiters = '{}',
        repeat_duplicates = true,
      }
    )
  ),
}
