# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall

# Detect platform (Linux, MacOS, Windows)
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
    CXXFLAGS += -D_LINUX
    LDFLAGS = 
endif

ifeq ($(UNAME_S),Darwin)
    CXXFLAGS += -D_DARWIN
    LDFLAGS = 
endif

ifeq ($(UNAME_S),Windows)
    CXXFLAGS += -D_WIN32
    LDFLAGS = -lstdc++fs
endif

# Source files
SRC = src/main.cpp

# Output executable
TARGET = generate_skeleton

# Default build rule
all: $(TARGET)

# Link and compile
$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRC) $(LDFLAGS)

# Clean up
clean:
	rm -f $(TARGET)

# For Windows
clean_windows:
	del /f $(TARGET).exe
