#!/usr/bin/env python

import random, sys
def genPin(length):
  pin    = []
  for x in xrange(0, int(length)):
    pin.append(random.randint(0, 9))
  print "Pin: " + str(pin).strip('[]').replace(',', '').replace(' ', '')

genPin(sys.argv[1]) 

