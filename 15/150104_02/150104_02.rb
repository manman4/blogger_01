N = 5
@count = 0
@board = Array.new(N){Array.new(N, false)}

# (x,y)にクィーンがあるかどうかチェック
def check(x, y)
  # 左方向をチェック
  p = x
  while p > 0
    return false if @board[p -= 1][y]
  end
  # 左上方向をチェック
  p, q = x, y
  while p > 0 && q > 0
    return false if @board[p -= 1][q -= 1]
  end
  # 左下方向をチェック
  p, q = x, y
  while p > 0 && q < N - 1
    return false if @board[p -= 1][q += 1]
  end
  return true
end

def showBoard
  for y in (0..N - 1)
    for x in (0..N - 1)
      printf @board[x][y]? 'Q ' : '. '
    end
    printf "\n"
  end
end

def solve(x)
  if x == N
    # すべての列にクィーンを置けたので、解を表示する。
    @count += 1
    showBoard
    puts "--" * N
  else
    # (x, 0) ... (x, N-1) にクィーンを置くことを試していく。
    for i in (0..N - 1)
      if check(x, i)
        # (x, i) にクィーンが置けるので、実際に置く。
        @board[x][i] = true
        # 次の列に進む
        solve(x + 1)
        # (x, i) に置いたクィーンを取り除く。
        @board[x][i] = false
      end
    end
  end
end

solve(0)
puts @count

