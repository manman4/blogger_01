import random

class Maze():
    """ 迷路を作るクラス"""
    # 壁は1、道は0
    PATH = 0
    WALL = 1

    def __init__(self, col, row):
        self.maze = []
        self.col = col
        self.row = row
        self.start_X = 1
        self.start_Y = 1
        self.goal_X = col - 2
        self.goal_Y = row - 2

        # 迷路は、幅および高さ5以上の奇数で生成する。
        if(self.row < 5 or self.col < 5):
            print('at least 5...')
            exit()
        if (self.col % 2) == 0:
            self.col += 1
            self.goal_X += 1
        if (self.row % 2) == 0:
            self.row += 1
            self.goal_Y += 1

    def set_maze(self):
        """ 迷路を作る。"""
        for x in range(0, self.col):
            row = []
            for y in range(0, self.row):
                if (x == 0 or y == 0 or x == self.col - 1 or y == self.row - 1):
                    cell = self.WALL
                else:
                    cell = self.PATH
                row.append(cell)
            self.maze.append(row)

        self.maze[self.start_X][self.start_Y] = 'S'
        self.maze[self.goal_X][self.goal_Y] = 'G'

        # 棒を倒す向き
        points = [[0, -1], [0, 1], [1, 0], [-1, 0]]

        # 一つおきに棒を配置
        for x in range(2, self.col - 1, 2):
            for y in range(2, self.row - 1, 2):
                self.maze[x][y] = self.WALL

                while True:
                    if x == 2:
                        r = points[random.randrange(0, 4)]
                    else:
                        r = points[random.randrange(0, 3)]

                    # 壁にする方向が壁でない場合は壁にする。
                    if self.maze[x + r[0]][y + r[1]] != self.WALL:
                        self.maze[x + r[0]][y + r[1]] = self.WALL
                        break

        return self.maze

    def show_maze(self):
        """ 迷路を出力する。"""
        for row in self.maze:
            for cell in row:
                if cell == self.PATH:
                    print('  ', end='')
                elif cell == self.WALL:
                    print('##', end='')
                elif cell == 'S':
                    print('S ', end='')
                elif cell == 'G':
                    print(' G', end='')
            print()


maze = Maze(10, 15)
maze.set_maze()
maze.show_maze()

