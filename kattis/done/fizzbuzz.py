#!/usr/bin/python

params = raw_input()

rng = int(params.split(" ")[2])
num1 = int(params.split(" ")[0])
num2 = int(params.split(" ")[1])

for i in range(1,rng+1):
 print (i%num1==0and'Fizz'or'')+(i%num2==0and'Buzz'or'')or i
