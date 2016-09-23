// Copyright 2016 Gerardo Teruel

#include <iostream>
#include "LowestSameDigitsMultipleFinder.hpp"

int main(int argc, char const *argv[]) {
  LowestSameDigitsMultipleFinder finder;
  int valor = finder.find();
  std::cout << valor << std::endl;
  return 0;
}
