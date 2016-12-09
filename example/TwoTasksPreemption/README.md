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

