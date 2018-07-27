
## Results in EV3OSEK with old cpu_support.S and execeptionhandler.S:
'''

Task 1(0, 0, 0) start at 1.

Task 1(1, 0, 0) end at 2001.

Task 2(1, 0, 0) start at 2004.

Task 2(1, 1, 0) end at 3995.

Task 3(1, 1, 0) start at 3998.

Task 1(1, 1, 1) start at 5001.

Task 1(2, 1, 1) end at 6992.

'''
#OS hangs after 7s.
## Results in EV3OSEK with patched cpu_support.S and exceptionhandler.S:
'''

Task 1(0, 0, 0) start at 1.

Task 1(1, 0, 0) end at 2005.

Task 2(1, 0, 0) start at 2008.

Task 2(1, 1, 0) end at 4003.

Task 3(1, 1, 0) start at 4005.

Task 1(1, 1, 1) start at 5001.

Task 1(2, 1, 1) end at 6995.

Task 3(2, 1, 1) end at 7998.

Task 2(2, 1, 1) start at 8001.

Task 2(2, 2, 1) end at 9995.

Task 1(2, 2, 1) start at 10001.

Task 1(3, 2, 1) end at 11995.

Task 3(3, 2, 1) start at 11998.

Task 3(3, 2, 2) end at 13993.

Task 1(3, 2, 2) start at 15001.

Task 1(4, 2, 2) end at 16996.

Task 2(4, 2, 2) start at 16998.

Task 2(4, 3, 2) end at 18993.

Task 1(4, 3, 2) start at 20001.

Task 1(5, 3, 2) end at 21996.

Task 3(5, 3, 2) start at 21998.

Task 3(5, 3, 3) end at 23993.

Task 2(5, 3, 3) start at 24001.

Task 1(5, 4, 3) start at 25001.

Task 1(6, 4, 3) end at 26996.

Task 2(6, 4, 3) end at 27993.

Task 1(6, 4, 3) start at 30001.

...
'''


For more output see OutputAfter10Min.txt File.
