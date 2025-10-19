#include <iostream>
#include "func.h"
#include "main.h"

int main()
{
  std::cout << "Hello World" << std::endl;
  int a, b;
  std::cin >> a >> b;
  int ans = add(a, b);
  std::cout << ans << std::endl;

  return 0;
}
