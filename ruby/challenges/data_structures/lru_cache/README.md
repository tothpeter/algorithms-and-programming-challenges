# LRU (last recently used) cache
## Requirements
- Get any element in ~ O(1) time
- Add new element in ~ O(1) time
- User is able to set the max count of elements to cache
  - Remove last used element before add new one if the list is full

## Implementation
- It uses a hash to return the reqired element in O(1) time
- It uses a doubly linked list to store the elements, orderd by usage