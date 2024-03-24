#include <stdio.h>
#include <stdint-gcc.h>



int func(int64_t * arr, int size);

int main()
{
    int64_t arr[] = { 600, 2, 34, 1000, 22, 83, 90 };
    int n = sizeof(arr) / sizeof(arr[0]);
    func(arr, n);
    printf("Sorted array: \n");
    for (int i = 0; i< n; i++) {
        printf("%lu", *(arr + i ));
        printf(" ");
    }
    return 0;
}
