// Copyright 2016 Gerardo Teruel

#include <iostream>
#include "Foo.hpp"

int main(int argc, char const *argv[]) {
  Foo foo(3);
  Foo other;
  other = foo;
  std::cout << "Foo value " << foo.getValue() << std::endl;
  std::cout << "Other value " << other.getValue() << std::endl;

  Foo c = other;
  std::cout << "Other value " << other.getValue() << std::endl;
  std::cout << "C value " << c.getValue() << std::endl;

  Foo d = other.getFoo();
  std::cout << "D created" << std::endl;

  Foo e(other.getFoo());
  std::cout << "E created" << std::endl;

  Foo f;
  f = foo.getFoo();
  std::cout << "F created" << std::endl;
  return 0;
}
