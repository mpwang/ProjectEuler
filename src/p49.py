from prime import *
from collections import defaultdict
from xpermutations import *

d = defaultdict(list)

for p in primes():
    if (p>9999):
        break
    if (p>1000):
        key = tuple(sorted(listOfDigits(p)))
        d[key].append(p)

for primeset in d.itervalues():
    if (len(primeset)>=3):
        for pset in xuniqueCombinations(primeset,3):
            if (pset[2]-pset[1]==pset[1]-pset[0]):
                print pset