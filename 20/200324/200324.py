from graphillion import GraphSet
import graphillion.tutorial as tl

def A(points, n):
    if n == 1: return 1
    universe = tl.grid(n - 1, n - 1)
    GraphSet.set_universe(universe)
    cycles = GraphSet.cycles()
    for i in points:
        cycles = cycles.including(i)
    return cycles.len()

print([A([                            ], n) for n in range(2, 10)])

print([A([1                           ], n) for n in range(2, 10)])

print([A([1, n                        ], n) for n in range(2, 10)])
print([A([1,    n * (n - 1) + 1       ], n) for n in range(2, 10)])
print([A([1,                     n * n], n) for n in range(2, 10)])

print([A([1, n, n * (n - 1) + 1       ], n) for n in range(2, 10)])

print([A([1, n, n * (n - 1) + 1, n * n], n) for n in range(2, 10)])

