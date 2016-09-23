// Copyright 2016 Gerardo Teruel
#include "LowestSameDigitsMultipleFinder.hpp"

const int LowestSameDigitsMultipleFinder::MAX_SIZE = 1000000;

int LowestSameDigitsMultipleFinder::find() {
  int value = -1;
  for(int i = 1; i < MAX_SIZE; i++) {
    if (classifier.classify(2*i, 3*i, 4*i, 5*i)) {
      value = i;
      break;
    }
  }

  return value;
}
