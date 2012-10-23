from functools import reduce
from operator import mul

s = reduce(lambda x,y: x+y, \
                [int(d) for d in str(reduce(lambda x,y: x*y, range(1,101)))])
print(s)

s = sum([int(d) for d in str(reduce(mul,range(1,101)))])
print(s)

