from graphillion import GraphSet

# (n > 3 and k > 2) or (n > 2 and k > 3)
def make_nXk_knight_graph(n, k):
    grids = []
    for i in range(1, k + 1):
        for j in range(1, n - 1):
            if i < k:
                grids.append((i + (j - 1) * k, i + (j + 1) * k + 1))
            if  i > 1:
                grids.append((i + (j - 1) * k, i + (j + 1) * k - 1))
    for i in range(1, k * n, k):
        for j in range(1, k - 1):
            if i < k * (n - 1):
                grids.append((i + j - 1, i + j + 1 + k))
            if i > k:
                grids.append((i + j - 1, i + j + 1 - k))
    return grids

def A(n, k):
    if n == 3 and k == 3: return 0
    universe = make_nXk_knight_graph(n, k)
    GraphSet.set_universe(universe)
    cycles = GraphSet.cycles(is_hamilton=True)
    return cycles.len()

print([A(3, n) for n in range(3, 30)])
print([A(4, n) for n in range(3, 20)])
print([A(5, n) for n in range(3, 10)])
print([A(6, n) for n in range(3, 8)])

