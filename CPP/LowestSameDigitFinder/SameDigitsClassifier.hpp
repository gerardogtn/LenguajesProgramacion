#ifndef SAMEDIGITSCLASSIFIER_H
#define SAMEDIGITSCLASSIFIER_H

#include <iostream>
#include <string>

class SameDigitsClassifier {
 public:
  bool classify(int a, int b) {
    std::string aString = std::to_string(a);
    std::string bString = std::to_string(b);
    if (aString.size() != bString.size()) return false;
    for(auto c : aString) {
      std::size_t p = bString.find_first_of(c);
      if (p == std::string::npos) {
        return false;
      }
    }
    return true;
  }

  template <typename... Args> bool classify(int a, int b, Args... args) {
    return classify(a, b) && classify(b, args...);
  }
};

#endif  // SAMEDIGITSCLASSIFIER_H
