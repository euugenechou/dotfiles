EXECBIN  = execname

SOURCES  = $(wildcard *.cpp)
OBJECTS  = $(SOURCES:%.cpp=%.o)

CC       = g++ -std=c++17
CFLAGS   = -Wall -Wpedantic -Werror -Wextra

.PHONY: all clean

all: $(EXECBIN)

$(EXECBIN): $(OBJECTS)
	$(CC) $^ -o $@

%.o : %.cpp
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f $(EXECBIN) $(OBJECTS)
