from graphillion import GraphSet
import graphillion.tutorial as tl

def A(start, goal, n):
    if n == 1: return 1
    universe = tl.grid(n - 1, n - 1)
    GraphSet.set_universe(universe)
    paths = GraphSet.paths(start, goal)
    return paths.len()

print([A(1,     2, n) for n in range(2, 10)])
print([A(1, n + 1, n) for n in range(2, 10)])
print([A(1,     n, n) for n in range(1, 10)])
print([A(1, n * n, n) for n in range(1, 10)])
