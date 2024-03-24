#include <stdio.h>
#include <stdlib.h>

int main()
{
	asm("nop");
	
	int src = 1;
    int dst;

	asm("mov eax, %1\n" 
		"mov %0, eax\n"
		 : "=r" (dst)
         : "r" (src)
		 : "eax");
	printf("%i\n", dst);
	return 0;
}