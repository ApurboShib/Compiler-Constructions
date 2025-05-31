#include <stdio.h>

int main()
{
    int A;

    printf("Enter the number: ");
    scanf("%d", &A);

    if (A & 1)
        printf("%d is an odd number.\n", A);
    else
        printf("%d is an even number.\n", A);

    return 0;
}