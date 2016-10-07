// Copyright 2016 Gerardo Teruel
#ifndef FOO_H
#define FOO_H

#include <iostream>

class Foo {
 private:
  int value;
 public:
  Foo(int value = 0) : value(value) {
    std::cout << "Constructor llamado con " << value << std::endl;
  }

  Foo(const Foo& foo) {
    std::cout << "Const copy constructor" << std::endl;
    value = foo.value;
  }

  ~Foo() = default;

  Foo& operator=(const Foo& x) {
    std::cout << "const copy assignment" << std::endl;
    return *this;
  }

  Foo& operator=(Foo&& x) {
    std::cout << "RValue Reference copy assignment" << std::endl;
    return *this;
  }

  Foo getFoo() {
    return *this;
  }

  int getValue() {
    return value;
  }
};

#endif  // FOO_H
