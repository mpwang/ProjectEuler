#my favorite solution
#move from scheme to python because this beauty!

def findPrime(limit):
    import math
    n=3
    primes = [2,]
    while len(primes)<=limit:
        for x in primes[:int(math.sqrt(len(primes)))]:
            if not(n%x): break
        else: primes.append(n)
        n+=2
    return max(primes)

print(findPrime(10001))
