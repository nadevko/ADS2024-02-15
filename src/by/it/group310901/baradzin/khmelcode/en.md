# Mirrorcity

## Description

In a distant land, a city named Mirrorcity was built. It was famous for its
unique architecture: each house on one side of the river had an exact mirror
reflection on the other bank. Tourists flocked here to admire this stunning
symmetry.

But one day, disaster struck: a strong storm destroyed part of the city, and the
mirror symmetry was disrupted. To restore the city to its former glory, it was
necessary to determine which part of the city still remained mirror-symmetrical.
The architects turned to you for help.

## Task

You are given a tree of houses and need to find all subtrees where the types of
houses are symmetrical. Subtrees that are subtrees of other found subtrees
should not be included in the result.

Input:

- The first number: an even number of addresses N.
- The next N separated by spaces pairs contain:
  - a three-digit address of a house;
  - a space (` `);
  - the type of the house as a single word.

Output:

- A single-line array in the following format:
  - opening square bracket (`[`);
  - three-digit addresses of results, listed in left-to-right breadth-first
    order:
    - if there are multiple addresses, they should be separated by a comma and a
      space `, `;
  - closing square bracket (`]`).

## Test Cases

### 1

- 000: A
  - **001: B**
    - **002: C**
    - **200: C**
  - 100: B
    - **003: D**

Input:

```text
6 000 A 001 B 100 B 002 C 200 C 003 D
```

Output:

```text
[001, 003]
```

### 2

- 000: A
  - **001: B**
    - **002: D**
    - **200: D**
  - 100: C
    - **003: E**

Input:

```text
6 000 A 001 B 100 C 002 D 200 D 003 E
```

Output:

```text
[001, 003]
```

### 3

- 000: House
  - **001: Store**
  - **100: Дом**

Input:

```text
3 100 House 000 House 001 Store
```

Output:

```text
[001, 100]
```

### 4

- **000: X**
  - **001: Y**
    - **002: Z**
    - **200: Z**
  - **100: Y**
    - **003: W**
    - **300: W**

Input:

```text
6 000 X 001 Y 100 Y 002 Z 200 Z 003 W 300 W
```

Output:

```text
[000]
```

### 5

- 000: P
  - 001: Q
    - 002: R
      - **004: T**
    - **200: R**
  - **100: Q**
    - **003: S**
    - **300: S**

Input:

```text
8 000 P 001 Q 100 Q 002 R 200 R 003 S 300 S 004 T
```

Output:

```text
[100, 200, 004]
```

### 6

- null

Input:

```text
0
```

Output:

```text
[]
```

### 7

- 000: M
  - **001: K**
    - **002: M**
    - **200: M**
  - **100: N**
    - **003: N**
    - **300: N**

Input:

```text
7 300 N 003 N 001 K 000 M 100 N 200 M 002 M
```

Output:

```text
[001, 100]
```

### 8

- 000: A
  - 001: B
    - 002: A
      - **004: C**
    - **200: A**
  - 100: B
    - **003: C**
    - **300: A**

Input:

```text
8 100 B 000 A 300 A 002 A 003 C 001 B 004 C 200 A
```

Output:

```text
[200, 003, 300, 004]
```

### 9

- 000: A
  - **001: B**
  - 100: A
    - **300: N**

Input:

```text
4 300 N 100 A 000 A 001 B
```

Output:

```text
[001, 300]
```

### 10

- 000: R
  - 001: S
    - 002: T
      - 004: V
        - **008: V**
    - **200: T**
  - **100: S**
    - **003: U**
    - **300: U**

Input:

```text
10 008 V 004 V 300 U 003 U 200 T 002 T 100 S 001 S 000 R
```

Output:

```text
[100, 200, 008]
```

# Theory

## Data Structures

### Trees

A tree is a hierarchical data structure consisting of nodes where:

- One node is the root.
- Each node can have multiple children but only one parent (except for the
  root).

It is commonly used for representing and processing data that has a hierarchical
nature, such as a file system, family tree, or directory structure. It is often
applied in search and sorting algorithms.

#### Array-based Tree Representation

In an array-based tree representation, each node is assigned an index, and the
relationships between nodes are determined by mathematical formulas:

- For a node with index \(i\):
  - Left child: \(2i + 1\).
  - Right child: \(2i + 2\).
  - Parent: \(\lfloor (i - 1) / 2 \rfloor\).

For this task, a tree with two methods is required:

1. **Insertion**
   - Nodes are added sequentially.
   - Relationships are automatically determined by indices.

2. **Search**:
   - Access to nodes is done directly via index.
   - To check symmetry, the children and their properties can be easily
     determined.

Advantages:

- Easy to process and check subtrees due to index-based access.
- Suitable if the tree is initially given in array form.
- Suitable for this task since the number of elements is known in advance.

#### Pointer-based Tree Representation

In a pointer-based tree representation, each node contains links to its
children:

- A node is represented as an object or structure with fields:
  - Node value.
  - Pointer to the left child.
  - Pointer to the right child.

For this task, a tree with two methods is required:

1. **Insertion**
   - Nodes are added through a recursive or iterative pass starting from the
     root.
   - New nodes are added to the first available free spot.

2. **Search**
   - To access a node, the tree must be traversed starting from the root.

Advantages:

- Convenient to work with recursion when checking symmetry of subtrees.
- Suitable for trees with dynamic sizes.
- Suitable for any task requiring trees.

## Algorithm

### General Solution Algorithm

1. Read the tree from the input.
2. Construct it in one of the representations (array or pointers).
3. Check the symmetry of subtrees:
   - For each node, check if its subtree is symmetrical.
   - Use recursion, BFS, hashing, or other methods.
4. Exclude nested subtrees (if required).
5. Output the addresses of the roots of symmetrical subtrees.

### Option 1: Recursive Symmetry Check

- **Complexity**: \(O(N^2)\).
- **Description**: For each node, we check if its subtree is symmetrical through
  recursion.

1. Traverse the tree in depth.
2. For each node, call a function to check symmetry, which:
   - Compares the left and right subtrees.
   - Recursively calls itself for the children.
3. If the subtree is symmetrical, add the node to the list.
4. Sort the found nodes.

Advantages:

- Simple to implement.

Disadvantages:

- Low performance on large trees.

### Option 2: Dynamic Programming

- **Complexity**: \(O(N)\).
- **Description**: Use memoization to store the results of checks for reuse.

1. Process the tree bottom-up.
2. For each node, determine if its subtree is symmetrical based on the results
   from its children.
3. If the node is symmetrical, record it.

Advantages:

- High performance.

Disadvantages:

- Complex to implement.

### Option 3: Iterative Tree Traversal (BFS)

- **Complexity**: \(O(N \cdot H)\).
- **Description**: Traverse the tree in breadth-first order using a queue to
  check symmetry.

1. Add the root node to the queue.
2. For each node:
   - Check the symmetry of its children.
   - If the node is symmetrical, add it to the result.
   - Add its children to the queue.
3. Repeat until all nodes are processed.

Advantages:

- Suitable for shallow trees.

Disadvantages:

- Low performance on trees with large heights.

### Option 4: Hashing Subtrees

- **Complexity**: \(O(N)\).
- **Description**: Represent each subtree as a string and hash it.

1. For each node, generate a string representation of its subtree.
2. Check if

 the hashes of the mirrored subtrees match.
3. If they match, add the node to the list.

Advantages:

- High speed.

Disadvantages:

- Requires extra memory for storing hashes.

### Option 5: Unique Identifiers

- **Complexity**: \(O(N \cdot H)\).
- **Description**: Use unique identifiers to check symmetry.

1. Assign a unique identifier to each node.
2. For each node, check if the sequences of identifiers for mirrored subtrees
   match.
3. If the identifiers match, the node is symmetrical.

Advantages:

- Simple to compare.

Disadvantages:

- Increased memory usage.

## Conclusion

For the task of checking symmetry of subtrees, the most suitable methods are:

- Dynamic programming for efficiency across all trees.
- Hashing for faster execution in most cases, but requires additional memory.
- The choice depends on memory constraints and the size of the tree.
