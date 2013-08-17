/**
 * If we list all the natural numbers below 10 that are multiples of 3 or 5
 * we get 3, 5, 6 and 9. The sum of these multiples is 23.
 * Find the sum of all the multiples of 3 or 5 below 1000.
 */
#include <stdio.h>
int target = 999;
int sumDivisibleBy(int n) {
        int p = target/n;
        return n * (p * (p+1)/2);
}

int main() {
        int answer = sumDivisibleBy(3) + sumDivisibleBy(5) - sumDivisibleBy(15);
        printf("%d\n",answer);

        return 0;
}
