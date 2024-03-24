#include <stdio.h>
#include <stdlib.h>
#include <x86intrin.h>

double get_rand()
{
	return 1.0/(rand()%10+1);
}

//! seed свідомо відсутній.
int main()
{
	
	__v2df v1 = {get_rand(), get_rand()};
	__v2df v2 = {get_rand(), get_rand()};
	__v2df v3 = _mm_add_pd(v1, v2);
	printf("[%f, %f] + [%f, %f] = [%f, %f]\n", 
			v1[0], v1[1], v2[0], v2[1], v3[0], v3[1]);
	return 0;
}