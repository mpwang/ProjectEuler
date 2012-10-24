#04 Dec 2007 06:45 pm
#nsheikh
#   Quote 0

#Here is how I did it in python. 
#Took about a second to run. No costly division checks. 
#Here is a hint for those still trying to do it fast: 
#modify the sieve of Eratosthenes a little so that 
#you are keeping track of a little more information than just whether it is a multiple or not.
        
import math

nums = [0]*200001
for i in range (2,200001):
    if nums[i] == 4:
       if nums[i+1] == 4 and nums[i+2] == 4 and nums[i+3] == 4:
          print i
          break
    else:
       if nums[i] == 0:
          for j in range (2,math.floor(200001/i)):
              nums[i*j] += 1