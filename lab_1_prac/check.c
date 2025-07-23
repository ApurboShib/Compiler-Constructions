#include <stdio.h>

int main()
{
    int a = 10;
    int b = 100;
    int sum = a + b;
    printf("%d\n", sum);
    return 0;
}
// clang -S -mllvm --x86-asm-syntax=intel check.i