#include <stdio.h>

int main()
{
    int x, y;

    printf("Enter two number: ");
    scanf("%d %d", &x, &y);

    (x > y)? printf("x (%d) is greater than y (%d)\n", x, y): (x < y)
        ? printf("y (%d) is greater than x (%d)\n", y, x)
        : printf("x (%d) and y (%d) are equal\n", x, y);

    return 0;
}