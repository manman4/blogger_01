def A(r):
    xy = [['□' for _ in range(r + 1)] for _ in range(r + 1)]
    a, x, y = r, 0, r
    while x <= y:
        xy[x][y], xy[y][x] = '■', '■'
        a, x = a - x - x - 1, x + 1
        if a < 0:
            a, y = a + y + y - 1, y - 1 
    for i in xy:
        print(''.join(i))

for i in range(21):
    A(i)

