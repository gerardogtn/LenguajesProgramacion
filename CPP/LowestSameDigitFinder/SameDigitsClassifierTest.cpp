#include "gmock/gmock.h"
#include "SameDigitsClassifier.hpp"
using ::testing::Eq;

class SameDigitsClassifierTest: public testing::Test {
public:
  SameDigitsClassifier classifier;
};

TEST_F(SameDigitsClassifierTest, AreTwoNumbersPalindromes) {
  ASSERT_THAT(classifier.classify(287, 278), Eq(true));
}

TEST_F(SameDigitsClassifierTest, DifferentLengthNumbersAreNotPalindromes) {
  ASSERT_THAT(classifier.classify(23, 237), Eq(false));
  ASSERT_THAT(classifier.classify(237, 23), Eq(false));
}

TEST_F(SameDigitsClassifierTest, AreMoreThanTwoNumbersPalindromes) {
  ASSERT_THAT(classifier.classify(237, 327, 732), Eq(true));
}
