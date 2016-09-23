#ifndef DELEGATE_H
#define DELEGATE_H

#include <vector>
#include <functional>
#include <iostream>

class Filter {
 private:
  std::vector<std::function<void(int&)>> functions;
  std::vector<int> nums {1, 2, 3, 4, 5, 6, 7, 8, 9};
  int valor = 0;

public:
  void push(std::function<void(int&)> f) {
    this->functions.push_back(f);
  }

  void pop(std::function<void(int&)> t) {

  }

  std::vector<int> filter(std::function<bool(int)> f) {
    std::vector<int> out;
    for (auto i : nums) {
      if (f(i)) out.push_back(i);
    }
    return out;
  }

  void run(int a) {
    for(auto f : functions) {
      f(a);
    }
  }
};

#endif  // DELEGATE_H
