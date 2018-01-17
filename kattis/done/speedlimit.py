#!/usr/bin/python

lines = []

while True:
  line = raw_input()
  if line:
    if ( int(line) == -1 ): break
    miles = 0
    time = 0
    cur_range = int(line) + 1
    for i in range(1, cur_range):
      cur_i = raw_input()
      cur_i = cur_i.split(" ")
      cur_mile = int(cur_i[0])
      cur_time = int(cur_i[1])
      miles += cur_mile * (cur_time - time)
      time = cur_time
    print "%s miles" % miles
  else: break

