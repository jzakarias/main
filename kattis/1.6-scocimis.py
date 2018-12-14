#!/usr/bin/python

input = list(map(int, raw_input().split()))
diff = []

for i in range(len(input)-1):
  diff.append(input[i+1]-input[i]-1)

print(max(diff))
