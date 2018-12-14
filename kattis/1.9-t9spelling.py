#!/usr/bin/python

t9 = [' ','','abc','def','ghi','jkl','mno','pqrs','tuv','wxyz']

def char_to_t9(cur_char):
  key = ''
  ret_str = ''
  for i in t9:
    if cur_char in i:
      key = t9.index(i)
      press = list(i).index(cur_char)+1
  for i in range(press):
    ret_str += str(key)
  return ret_str

case_count = int(raw_input())
for i in range(case_count):
  textt9 = ' '
  text = list(raw_input())
  for j in text:
    jt9 = char_to_t9(j)
    if textt9[-1] == jt9[0]:
      textt9 += ' '
    textt9 += jt9
  print "Case #"+str(i+1)+":"+textt9
