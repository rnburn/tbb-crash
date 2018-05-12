#include <tbb/task_scheduler_init.h>
#include <tbb/task_group.h>
#include <iostream>
#include <cstdlib>
#include "a.pb.h"

using namespace tbb;

int fib(int n) {
  if (n < 2) {
    return n;
  } else {
    int x, y;
    task_group g;
    g.run([&] { x = fib(n - 1); });  // spawn a task
    g.run([&] { y = fib(n - 2); });  // spawn another task
    g.wait();			     // wait for both tasks to complete
    return x + y;
  }
}

int main(int argc, char* argv[]) {
  A a;
  tbb::task_scheduler_init tbb_init{};
  std::cout << a.DebugString() << "\n";
  if (argc != 2) {
    std::cout << "Usage: fib <n>\n";
    return 0;
  }
  std::cout << fib(std::atoi(argv[1])) << "\n";
  return 0;
}
