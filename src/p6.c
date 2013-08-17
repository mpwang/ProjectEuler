#include <stdio.h>
#include <math.h>

int range = 100;

double solution1() {
        double v = pow( range * (range + 1)/2.0, 2.0)
                - range * (range + 1) * ( 2 * range + 1)/6.0;
        return v;
}

// (1 + 2 + 3 + ...)^2 = 1^3 + 2^3 + 3^3 + ...
double solution2() {
        return 0.0;
}

int main() {
        double v = solution1();
        printf("%f\n", v);
        return 0;
}
