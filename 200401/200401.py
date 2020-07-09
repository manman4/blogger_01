from graphillion import GraphSet
import graphillion.tutorial as tl

def A333520(n):
    if n == 1: return [1]
    universe = tl.grid(n - 1, n - 1)
    GraphSet.set_universe(universe)
    start, goal = 1, n * n
    paths = GraphSet.paths(start, goal)
    return [paths.len(2 * (n - 1 + k)).len() for k in range((n - 1) ** 2 // 2 + 1)]

def A329633(n):
    if n == 1: return [1]
    universe = tl.grid(n - 1, n - 1)
    GraphSet.set_universe(universe)
    start, goal = 1, n
    paths = GraphSet.paths(start, goal)
    return [paths.len(n - 1 + 2 * k).len() for k in range(n * (n - 1) // 2 + 1)]

a_list = []
for n in range(1, 10):
    a = A333520(n)
    a_list.append(sum(a))
    print([n, a])
print(a_list)

a_list = []
for n in range(1, 10):
    a = A329633(n)
    a_list.append(sum(a))
    print([n, a])
print(a_list)

