maximum = 0

def find(x):
        global maximum
        n = x
        print('find:',n)
        stack = []
        while x != 1:
                stack.append(x)
                if x % 2 == 0:
                        x //= 2
                else:
                        x = 3 * x + 1
        else:
                if len(stack) > maximum:
                        maximum = len(stack)
                #print(n,end=' ')
                #print(len(stack),end= ' ')
                #print(stack)

for n in range(2,10000000):
        find(n)

print("max: ",maximum+1)

