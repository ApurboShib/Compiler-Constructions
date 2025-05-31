#include <stdio.h>
int main()
{
    char arr[100];

    printf("Enterthe number: ");
    scanf("%s", &arr);

    if (arr[0] == '0')
        printf(" The first number is 0.");
    else
        printf(" The first number is not 0.");

    return 0;
}