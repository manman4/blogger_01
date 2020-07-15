from graphillion import GraphSet
import graphillion.tutorial as tl

def A(n):
    universe = tl.grid(n - 1, n - 1)
    GraphSet.set_universe(universe)
    start, goal = 1, 2
    paths = GraphSet.paths(start, goal)
    for i in range(3, n * n + 1):
        paths = paths.including(i)
    return paths.len()

def A003763(n):
    return A(2 * n)

print([A003763(n) for n in range(1, 5)])
