#! /usr/bin/env python
# -*- coding: utf-8 -*-
# A small unused kernel cleaner for Ubuntu

from subprocess import check_output, check_call, STDOUT
import sys

# step 0 - determine installed kernels
kernels = check_output( ['-c',
      "ls /boot | grep vmlinuz | sed 's/vmlinuz-//;s/-[a-z]*$//'"],
      shell=True ).strip().split('\n')

print( 'Installed kernel(s)', kernels )

# step 1 - determine current kernel
curr_kern = check_output( ['-c',
      "uname -r | sed 's/-[a-z]*$//'"], shell=True ).strip()

print( 'Current kernel: ', curr_kern )

# step 2 - exclude from the list current and newest kernel
kernels.sort()
if kernels[-1] > kernels[kernels.index(curr_kern)]: kernels.pop()
kernels.remove(curr_kern)

if len( kernels ) > 0:
    print( 'To remove kernels now: ', kernels )
else:
    print( 'Only one kernel installed, giving up!' )
    sys.exit(0)
