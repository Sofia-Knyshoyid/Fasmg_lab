#include <stdio.h>
#include "solve_equation.h"

int main(){
	size_t size = 3;	
	double a[] = {2.0, 1.3, 4.2};
	double b[] = {4.6, 2.6, 2.0};
	double x[] = {0, 0, 0};
	solve_equation(a, b, x, size);
	for (size_t i = 0; i < size; i++) {
		printf("%d*x + %d = 0", *(a + i), *(b+i));
	}
	return 0;
}

