#include "gmock/gmock.h"
#include "LowestSameDigitsMultipleFinder.hpp"
using ::testing::Eq;

TEST(LowestSameDigitsMultipleFinder, MultiplesFromTwoToFive) {
  LowestSameDigitsMultipleFinder finder;
  ASSERT_THAT(finder.find(), Eq(142857));
}
