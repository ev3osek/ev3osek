
Three tasks are deployed. The example will demonstrate if the system has the support of nested preemption or not.
However, it shouldn't have this feature in the current design.

## Results in EV3OSEK with old cpu_support.S and execeptionhandler.S:
'''
Task 1(0) start at 1.

Task 1(2) end at 1925.

Task 2(0) start at 1927.

Task 2(2) end at 3764.

Task 3(0) start at 3766.

Task 3(2) end at 5681.

Task 3(2) start at 7001.

Task 2(2) start at 8001.

Task 1(2) start at 9001.

Task 1(4) end at 10916.

Task 2(6) end at 12752.

Task 3(6) end at 14667.

Task 2(6) start at 16001.

Task 2(8) end at 17837.

Task 1(4) start at 18001.

Task 1(6) end at 19915.

Task 3(6) start at 21001.

Task 3(8) end at 22916.

Task 2(8) start at 24001.

Task 2(10) end at 25837.

Task 1(6) start at 27001.

Task 1(8) end at 28916.

Task 3(8) start at 28918.

Task 3(10) end at 30833.

...
'''
## Results in EV3OSEK with patched cpu_support.S and exceptionhandler.S:
'''
Task 1(0) start at 1.

Task 1(2) end at 2005.

Task 2(0) start at 2007.

Task 2(2) end at 4001.

Task 3(0) start at 4004.

Task 3(2) end at 5998.

Task 3(2) start at 7001.

Task 2(2) start at 8001.

Task 1(2) start at 9001.

Task 1(4) end at 10995.

Task 2(4) end at 11992.

Task 3(4) end at 12989.

Task 3(4) start at 14001.

Task 3(6) end at 15995.

Task 2(4) start at 16001.

Task 2(6) end at 17995.

Task 1(4) start at 18001.

Task 1(6) end at 19995.

Task 3(6) start at 21001.

Task 3(8) end at 22995.

Task 2(6) start at 24001.

Task 2(8) end at 25995.

Task 1(6) start at 27001.

Task 1(8) end at 28995.

Task 3(8) start at 28997.

Task 3(10) end at 30992.

...
'''

