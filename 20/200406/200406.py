from graphillion import GraphSet
import graphillion.tutorial as tl

def four_corners(n):
    return [1, n, n * (n - 1) + 1, n * n]

def points_on_diagonal_1(n):
    return [i + 1 for i in range(n * n) if i % n - i // n == 0]

def points_on_diagonal_2(n):
    return [i + 1 for i in range(n * n) if i % n + i // n == n - 1]

def points_on_two_diagonals(n):
    return [i + 1 for i in range(n * n) if i % n - i // n == 0 or i % n + i // n == n - 1]

def A(points, n):
    print(points)
    universe = tl.grid(n - 1, n - 1)
    GraphSet.set_universe(universe)
    cycles = GraphSet.cycles()
    for i in points:
        cycles = cycles.including(i)
    return cycles.len()

print([A(four_corners(n),            n) for n in range(2, 10)])
print([A(points_on_diagonal_1(n),    n) for n in range(2, 10)])
print([A(points_on_diagonal_2(n),    n) for n in range(2, 10)])
print([A(points_on_two_diagonals(n), n) for n in range(2, 10)])

