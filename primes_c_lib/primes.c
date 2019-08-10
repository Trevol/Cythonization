#include <stdlib.h>
#include <stdio.h>
#include "primes.h"

int* primes(int numberOfPrimes){
    int * primes = malloc(numberOfPrimes*sizeof(int));
    if (primes == NULL){
        return NULL;
    }
    int i, isPrime;
    int n = 2; //start from 2
    int current = 0;
    while (current < numberOfPrimes){
        isPrime = 1;
        for (i=0;i<current;i++){
            if (n % primes[i] == 0){
                isPrime = 0;
                break;
            }
        }
        if (isPrime == 1){
            primes[current] = n;
            current++;
        }
        n++;
    }

    return primes;
}