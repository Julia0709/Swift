# CUI 2048+ Game
A command line game app '2048'.


### How to play
Use your i, j, k or l keys to move the tiles. When two tiles with the same number touch, they merge into one!

1. Select a mode

| KEY | MODE   | GOAL             |
|:---:|:-------|:-----------------|
|  1  | EASY   | Make a 512 tile  |
|  2  | NORMAL | Make a 2048 tile |
|  3  | HARD   | Make a 4096 tile |
|  4  | EXPERT | Make a 8192 tile |

```
Select a mode number:
1: EASY  2: NORMAL  3: HARD  4: EXPERT
```

2. Make a move

| KEY | DIRECTION |
|:---:|:----------|
|  i  | UP(↑)     |
|  j  | LEFT(←)   |
|  k  | DOWN(↓)   |
|  l  | RIGHT(→)  |

```
i: UP(↑)  j: LEFT(←)  k: DOWN(↓)  l: RIGHT(→) | q: (QUIT)
```


### Output Example

```
=================================
        Welcome to 2048+
=================================
Select a mode number:
1: EASY  2: NORMAL  3: HARD  4: EXPERT
2
NORMAL MODE: GAME START!
GOAL: 2048  SCORE: 0
+-------------------------------+
|       |       |       |       |
|       |       |       |       |
|       |       |       |       |
+-------------------------------+
|       |       |       |       |
|       |     2 |       |     2 |
|       |       |       |       |
+-------------------------------+
|       |       |       |       |
|       |       |       |       |
|       |       |       |       |
+-------------------------------+
|       |       |       |       |
|       |       |       |       |
|       |       |       |       |
+-------------------------------+
i: UP(↑)  j: LEFT(←)  k: DOWN(↓)  l: RIGHT(→) | q: (QUIT)
l
RIGHT(→)
GOAL: 2048  SCORE: 4
+-------------------------------+
|       |       |       |       |
|       |       |       |       |
|       |       |       |       |
+-------------------------------+
|       |       |       |       |
|       |     2 |       |     4 |
|       |       |       |       |
+-------------------------------+
|       |       |       |       |
|       |       |       |       |
|       |       |       |       |
+-------------------------------+
|       |       |       |       |
|       |       |       |       |
|       |       |       |       |
+-------------------------------+
i: UP(↑)  j: LEFT(←)  k: DOWN(↓)  l: RIGHT(→) | q: (QUIT)
k
DOWN(↓)
GOAL: 2048  SCORE: 4
+-------------------------------+
|       |       |       |       |
|       |       |     2 |       |
|       |       |       |       |
+-------------------------------+
|       |       |       |       |
|       |       |       |       |
|       |       |       |       |
+-------------------------------+
|       |       |       |       |
|       |       |       |       |
|       |       |       |       |
+-------------------------------+
|       |       |       |       |
|       |     2 |       |     4 |
|       |       |       |       |
+-------------------------------+
```

