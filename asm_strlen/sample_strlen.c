#include <stdio.h>
#include <stdlib.h>
#include <string.h>

size_t  my_strlen_primitive(const char* str);
size_t  my_strlen_adv1(const char* str);
size_t  my_strlen_strlen(const char* str);

int main()
{
	size_t sz = 100000000;
	char* text = malloc(sz+1);
	text[sz]='\0';
	for(size_t i = 0; i<sz; ++i)
		text[i] = rand()%90+32;
	
	size_t sz0 = strlen(text);
	printf("Std. strlen: %zu\n", sz0);	
	
	size_t sz1 = my_strlen_strlen(text);
	printf("Std. strlen called by asm: %zu\n", sz1);	
	
	size_t sz2 = my_strlen_primitive(text);
	printf("Primitive asm strlen: %zu\n", sz2);	
	
	size_t sz3 = my_strlen_adv1(text);
	printf("Advanced asm strlen: %zu\n", sz3);
	return 0;
}