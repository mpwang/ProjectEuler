#ifndef _MYUTILS_H
#define _MYUTILS_H
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

/**
 * Fn = (fi ** n - bi ** n)/sqrt(5)
 * bi = - 1/fi
 * Fn = (fi ** n - (-fi) ** (-n))/sqrt(5)
 */
int fib(int n) {
        double fi = (1 + sqrt(5))/2;
        double rs = (pow(fi, n) - pow(-fi, -n))/sqrt(5);
        return (int)rs;
}
#endif

