#include <stdio.h>
int main()
{
    int a, b;
    scanf("%d %d", &a, &b);
    int sum = a + b;
    if (sum % 2 == 0)
    {
        printf("yes");
    }
    else
    {
        printf("no");
    }
}