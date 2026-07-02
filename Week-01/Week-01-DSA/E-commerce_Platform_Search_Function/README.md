Time Complexity Comparison
1.Linear Search:

Linear Search checks each product one by one until the target product is found.

Best Case: O(1)
Product found at the first position.
Average Case: O(n)
Product found somewhere in the middle.
Worst Case: O(n)
Product found at the last position or not found at all.

Example:

Products: Laptop, Mobile, Watch, Camera, Headphones

Searching for Camera:
Laptop → Mobile → Watch → Camera

2.Binary Search:

Binary Search works only on a sorted array.

It repeatedly divides the search space into two halves.

Best Case: O(1)
Product found at the middle position.
Average Case: O(log n)
Worst Case: O(log n)

Example:

Sorted Products:
Camera, Headphones, Laptop, Mobile, Watch

Searching for Camera:
Check Laptop → Move Left → Check Camera