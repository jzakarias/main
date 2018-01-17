#!/usr/bin/python

# init Table
Table = [[0 for x in range(5)] for y in range(5)]

# read Table
for i in range(0,5):
  line = raw_input()
  for j in range(0,5):
    Table[i][j] = line[j]


