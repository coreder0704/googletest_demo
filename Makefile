CXX = clang++
CXXFLAGS = -std=c++17 -Wall -Wextra
BUILD_DIR = build
SRC_DIR = src
TEST_DIR = unittests
TEST_BUILD_DIR = unittests/build
TESTLIB_DIR = googletest-1.17.0
TEST_INC = $(TESTLIB_DIR)/googletest/include
TEST_LIB = $(TESTLIB_DIR)/lib

TARGET = $(BUILD_DIR)/main
TEST_TARGET = $(TEST_BUILD_DIR)/unittests

# test_*.cpp から test_*.o を生成
TEST_SRCS = $(wildcard $(TEST_DIR)/test_*.cpp)
TEST_OBJS = $(patsubst $(TEST_DIR)/test_%.cpp, $(TEST_BUILD_DIR)/test_%.o, $(TEST_SRCS))

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRCS))

all: $(TARGET)
	./$(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

unittests: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(TEST_OBJS) $(BUILD_DIR)/func.o
	$(CXX) $(CXXFLAGS) -o $@ $^ -L$(TEST_LIB) -lgtest -lgtest_main -pthread

$(TEST_BUILD_DIR)/test_%.o: $(TEST_DIR)/test_%.cpp
	mkdir -p $(TEST_BUILD_DIR)
	$(CXX) $(CXXFLAGS) -I$(TEST_INC) -c -o $@ $<

clean:
	rm -f $(OBJS) $(TARGET) $(TEST_OBJS) $(TEST_TARGET)

.PHONY: all unittests clean
