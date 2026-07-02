Financial Forecasting using Recursion

Recursion:
Recursion is a technique where a method calls itself to solve a smaller version of the same problem.
It is useful when a problem can be divided into repeated smaller subproblems.

Formula:
Future Value = Current Value * (1 + Growth Rate)^Years

Recursive Approach:
If years = 0, return the current value.
Otherwise, calculate the value for years - 1 and multiply it by (1 + growthRate).

Time Complexity:
O(n), where n is the number of years.

Space Complexity:
O(n), because recursive calls are stored in the call stack.

Optimization:
The recursive solution can be optimized by using iteration instead of recursion.
This reduces space complexity from O(n) to O(1).