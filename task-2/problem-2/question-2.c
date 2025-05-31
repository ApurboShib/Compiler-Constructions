#include <stdio.h>
int main()
{
    char ch;
    int number;
    scanf("%c", &ch);
    if (ch == '-')
    {
        scanf("%d", &number);
        int Sub = number - 200;
        printf("%d", Sub);
    }
}