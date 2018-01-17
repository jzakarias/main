#!/usr/bin/python

cur_input = int(raw_input())

i_bin = "{0:b}".format(cur_input)

print int(i_bin[::-1],2)
