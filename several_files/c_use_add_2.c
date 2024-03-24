#include <stdio.h>
#include "add_2.h"

int main(){
	int x = 5, y = 7;
	int z;
	z = add_2(x, y);
	printf("%i + %i = %i\n", x, y, z);
	return 0;
}