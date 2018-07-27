This example contains two tasks with artifical execution time by using busy loop.
The period of task 1 is 9000(ms) and the period of task 2 is 8000(ms).
Task 2 will be executed first and be preempted by task 1 at time point 9000. 
After the execution of task 1, task 2 will resume but the LOOP macros are somehow repeated.

The outputs are as follows:
2(0, 0) st 1. <<--- Task 2 starts

2(0, 2) et 1847. <<--- Task 2 ends, so the counter b is 2.

2(0, 2) et 8001. <<--- Task 2 starts

1(0, 4) et 9001. <<--- Task 1 preempts task 2, at the moment, the counter b is already 4. (Task 2 has remaining 1000ms to execute)

1(2, 4) et 10914. <<--- Task 1 ends, so the counter a is 2.

2(2, 6) et 12749. <<--- Task 2 resumes but re-executes the loops, so the counter b is 6.

2(2, 6) et 16001. <<--- Task 2 ends with additional execution time around 2000ms.

What we expect in the normal preemption is that the resumed point (lr) should be the exact point incurred the preemption.
Therefore the expected results should be:

2(0, 0) st 1. 

2(0, 2) et 1847. 

2(0, 2) et 8001. 

1(0, 4) et 9001. 

1(2, 4) et 10914. 

2(2, 4) et 11749~12000. <<--- Task 2 resumes but only finishs the rest of loop.

## Results in EV3OSEK with old cpu_support.S and execeptionhandler.S:
'''
Task 1(0, 0) start at 1.

Task 1(2, 0) end at 1925.

Task 2(2, 0) start at 1928.

Task 2(2, 2) end at 3764.

Task 2(2, 2) start at 8001.

Task 1(2, 4) start at 9001.

Task 1(4, 4) end at 10916.

Task 2(4, 6) end at 12752.

Task 2(4, 6) start at 16001.

Task 2(4, 8) end at 17837.

Task 1(4, 8) start at 18001.

Task 1(6, 8) end at 19915.

Task 2(6, 8) start at 24001.

Task 2(6, 10) end at 25837.

Task 1(6, 10) start at 27001.

Task 1(8, 10) end at 28916.

...

'''

## Results in EV3OSEK with patched cpu_support.S and exceptionhandler.S:

'''

Task 1(0, 0) start at 1.

Task 1(2, 0) end at 1929.

Task 2(2, 0) start at 1931.

Task 2(2, 2) end at 3771.

Task 2(2, 2) start at 8001.

Task 1(2, 4) start at 9001.

Task 1(4, 4) end at 10919.

Task 2(4, 4) end at 11762.

Task 2(4, 4) start at 16001.

Task 2(4, 6) end at 17841.

Task 1(4, 6) start at 18001.

Task 1(6, 6) end at 19919.

Task 2(6, 6) start at 24001.

Task 2(6, 8) end at 25841.

Task 1(6, 8) start at 27001.

Task 1(8, 8) end at 28919.

Task 2(8, 8) start at 32001.
...

'''



