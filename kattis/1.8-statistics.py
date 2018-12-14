#!/usr/bin/python

import fileinput

lcount = 0

for line in fileinput.input():
  line = map(int, line.split())
  count = line[0]
  del line[0]
  lcount += 1
  lmax = max(line)
  lmin = min(line)
  lrng = lmax-lmin
  print "Case "+str(lcount)+": "+str(lmin)+" "+str(lmax)+" "+str(lrng)
