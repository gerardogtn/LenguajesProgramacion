#include <iostream>
#include <functional>

void ejecutarFuncion(std::function<void(int &)> f);

int main(int argc, char const *argv[]) {
	int z = 2; 
	int a = 1; 
	auto f = [=](int & num) mutable {
		std::cout << "b: " << num << std::endl;
		std::cout << "z: " << z << std::endl;
		std::cout << "a: " << a << std::endl; 
	};
	ejecutarFuncion(f);
	return 0;
}

void ejecutarFuncion(std::function<void(int &)> f) {
	int a = 5;
	f(a);
}

