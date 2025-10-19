#include <gtest/gtest.h>
#include "../src/func.h"

TEST(AddTest, PositiveNumbers) {
    EXPECT_EQ(5, add(2, 3));
}

TEST(AddTest, NegativeNumbers) {
    EXPECT_EQ(-1, add(-2, 1));
}

TEST(AddTest, Zero) {
    EXPECT_EQ(0, add(0, 0));
}
