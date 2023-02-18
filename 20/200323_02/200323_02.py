from graphillion import GraphSet
import graphillion.tutorial as tl

def A(n):
    universe = tl.grid(n - 1, n - 1)
    GraphSet.set_universe(universe)
    cycles = GraphSet.cycles(is_hamilton=True)
    return cycles.len()

def A003763(n):
    return A(2 * n)

print([A003763(n) for n in range(1, 5)])
