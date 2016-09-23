#ifndef LOWESTSAMEDIGITSMULTIPLEFINDER_H
#define LOWESTSAMEDIGITSMULTIPLEFINDER_H

#include "SameDigitsClassifier.hpp"

/*
Encuentra el número positivo menor tal que su doble, triple, cuadruple
 y quintuple son números que contienen los mismos dígitos.
(que no sea el cero)
*/
class LowestSameDigitsMultipleFinder {
 private:
  static const int MAX_SIZE;
  SameDigitsClassifier classifier;

 public:
  int find();
};

#endif  // LOWESTSAMEDIGITSMULTIPLEFINDER_H
