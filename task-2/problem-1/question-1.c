#include <stdio.h>
int main()
{

    char ch;
    int number;
    scanf("%c", &ch);
    if (ch == '+')
    {
        scanf("%d", &number);
        int add = number + 10;
        printf("%d\n", add);
    }
    return 0;
}