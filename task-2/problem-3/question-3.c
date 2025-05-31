#include <stdio.h>
int main()
{
    int A;

    printf("Enter the number: ");

    scanf("%d", &A);

    if (A % 2 == 0)
        printf("X is the even number.");

    return 0;
}