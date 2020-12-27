from graphillion import GraphSet

def make_stairs(m, n):
    s = 1
    grids = []
    for i in range(m * n + 1, 1, -m):
        for j in range(i - 1):
            a, b, c = s + j, s + j + 1, s + i + j
            grids.append((a, b))
            if j < i - m:
                grids.append((a, c))
        s += i
    return grids

def A(m, n):
    if m== 0 or n == 0: return 1
    universe = make_stairs(m, n)
    GraphSet.set_universe(universe)
    start, goal = m * n + 1, (n + 1) * (m * n + 2) // 2
    paths = GraphSet.paths(start, goal)
    return paths.len()

a = [0, 18, 12, 9, 7, 6]
for m in range(1, 6):
    print([m, [A(m, n) for n in range(a[m])]])