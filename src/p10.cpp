#include "myutils.h"
#include <time.h>

long long num = 2000000; //2 million

int main() {
        long long sum = 2;
        for(long i = 3; i < num ; i += 2) {
                if(isPrime(i)) {
                        sum += i;
                }
        }
        printf("sum: %lld ", sum);

        return 0;
}

