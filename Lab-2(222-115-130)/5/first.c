#include <stdio.h>
int main()
 {
    char x[100];  

    printf("Enter number: ");
    scanf("%s", &x);
    
    if(x[0]=='0')
    printf("First number is 0.");
    else 
    printf("First number is not 0.");

    return 0;
}