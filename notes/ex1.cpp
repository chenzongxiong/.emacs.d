// https://en.wikipedia.org/wiki/Most_vexing_parse
// class Timer {
// public:
//   Timer();
// };

// class TimeKeeper {
// public:
//   TimeKeeper(const Timer& t);

//   int get_time();
// };

// int main() {
//   TimeKeeper time_keeper(Timer());
//   return time_keeper.get_time();
// }


// https://www.fluentcpp.com/2018/01/30/most-vexing-parse/
// class B
// {
//   // B() {}
//   // explicit B(int x){}
// public:
//   B() {}
//   B(int x) {}
// };

// class A
// {
// public:
//   A (B const& b){}
//   void doSomething(){}
// };

// int main()
// {
//   // A a(B(x));
//   // A a(B{});
//   a.doSomething();
// }


// #include <iostream>

// class A {
// public:
//   A(){ std::cout << "A() is called" << std::endl; }
//   A(int) { std::cout << "A(int) is called" << std::endl; }
// };

// int main() {
//   std::cout << "The Most Vexing Parse" << std::endl;
//   A a1 {};
//   std::cout << "----------------------------------------" << std::endl;
//   A a2(5);
//   std::cout << "----------------------------------------" << std::endl;
//   A a3;
//   std::cout << "----------------------------------------" << std::endl;
//   return 0;
// }

// #include <iostream>
// int f1(double a);
// int f2(double (a));
// int f3(double);

// int f1(double a) {
//   std::cout << "f1(a): " << a << std::endl;
//   return 0;
// }
// int f2(double (a)) {
//   std::cout << "f2(a): " << a << std::endl;
//   return 0;
// }
// int f3(double a) {
//   std::cout << "f3(a): " << a << std::endl;
//   return 0;
// }
// int main() {
//   std::cout << "Function Declarations" << std::endl;
//   f1(1.0);
//   f2(2.0);
//   f3(3.0);
//   return 0;
// }

// #include <iostream>
// class B;
// class A {
// public:
//   explicit A() { std::cout << "A() is called" << std::endl; }
//   explicit A(const B &b) { std::cout << "A(const B &) is called" << std::endl; }
//   void foo() { std::cout << "A.foo is called" << std::endl; }
// };
// class B {
// public:
//   B() { std::cout << "B() is called " << std::endl; }
// };


// int main() {
//   A a((B()));
//   a.foo();
//   return 0;
// }

#include <iostream>

int main() {
  class B;

  B test();
  return 0;
}
