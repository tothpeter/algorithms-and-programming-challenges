Task: We have an array of ranges, the algorithm should return an array with the merged ranges

Example
- Given input: [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]
- Execute:
  - [0, 1], [3, 5] are not overlapping we can't merge them
  - [3, 5], [4, 8] are overlapping we can merge them to one range: [3, 8]
  - [10, 12], [9, 10] are overlapping as well, so we can merge again: [9, 12]

- Expected output: [ [0, 1], [3, 8], [9, 12] ]