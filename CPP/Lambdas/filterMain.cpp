#include <iostream>
#include <functional>
#include "Filter.hpp"

int main(int argc, char const *argv[]) {
  Filter filter;

  auto f = [=](int & a) {
    std::cout << "a: " << a << std::endl;
  };
  filter.push(f);

  auto sqrF = [=](int & a) {
    int sqr = a * a;
    std::cout << "a2: " << sqr << std::endl;
  };

  filter.push(sqrF);
  filter.run(5);


  for (auto e : filter.filter([](int a){return a % 2 == 0;})) {
    std::cout << e << " ";
  }
  std::cout << std::endl;
  return 0;
}
