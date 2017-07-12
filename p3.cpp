#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

// sieve method to generate primes.
// efficient enough
long long primes[1000000] = {2};
long pfound = 1;

int isPrime(long long n) {
        if(primes[pfound-1] == n) {
                return 1;
        }else if(primes[pfound-1] > n) {
                for(int i = 0; i < pfound; i++)
                        if(primes[i] == n)
                                return 1;
        }
        double flag = sqrt(n);
        for(long i = 0; i < pfound; i++) {
                if(primes[i] > flag) {
                        break;
                }else if(n %primes[i] == 0) {
                        return 0;
                }
        }
        primes[pfound++] = n;
        return 1;
}

long long num = 600851475143;
int main() {
        long st = clock();
        for(long i = 3; i < (long long)sqrt(num); i+= 2) {
                isPrime(i);
        }
        long long maxPrime = 2;
        for(long i = pfound-1; i >= 0; i--) {
                if(num % primes[i] == 0) {
                        long long dv = num/primes[i];
                        if(isPrime(dv)) {
                                maxPrime = dv;
                                break;
                        }
                        maxPrime = primes[i];
                        break;
                }
        }
        long et = clock();
        printf("max:%lld\n",maxPrime);
        printf("time:%ldms\n", et-st);

        return 0;
}
