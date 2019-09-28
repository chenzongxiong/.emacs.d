#include <iostream>

class X {};
class Y: public virtual X {};
class Z: public virtual X {};
class A: public Y, public Z {};


int main() {
    std::cout << "sizeof(X): " << sizeof(X)
              << "\nsizeof(Y): " << sizeof(Y)
              << "\nsizeof(Z): "  << sizeof(Z)
              << "\nsizeof(A): " << sizeof(A)
              << std::endl;
    return 0;
}
