#!/usr/bin/python

cypher = list(raw_input())
key = list(raw_input())
cypher_n = []
key_n = []

for i in cypher:
  cypher_n.append(ord(i))

for i in key:
  key_n.append(ord(i))

key_len = len(key_n)
msg_len = len(cypher_n)
base = ord('A')

msg_n = []

if key_len < msg_len:
  for i in range(key_len):
    msg_n.append((cypher_n[i]-key_n[i]+26)%26+base)
  for i in range(key_len, msg_len):
    j = i-key_len
    msg_n.append((cypher_n[i]-msg_n[j]+26)%26+base)
else:
  for i in range(msg_len):
    msg_n.append((cypher_n[i]-key_n[i]+26)%26+base)

msg = ''

for i in msg_n:
  msg += unichr(i)

print msg
