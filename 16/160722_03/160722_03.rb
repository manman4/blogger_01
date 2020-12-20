def A0(ary, n)
  m = ary.size
  a_ary = [ary]
  p a_ary[0]
  n.times{|i|
    a_ary << Array.new(m, 1)
    (m - 2).downto(1){|j| a_ary[i + 1][j] = (a_ary[i][j - 1] * a_ary[i + 1][j + 1] + 1) / a_ary[i][j]}
    p a_ary[i + 1]
  }
end

def f(ary, n)
  m = ary.size
  a_ary = [ary]
  p [0] + a_ary[0]
  n.times{|i|
    a_ary << Array.new(m, 1)
    (m - 2).downto(1){|j| a_ary[i + 1][j] = (a_ary[i][j - 1] * a_ary[i + 1][j + 1] + 1) / a_ary[i][j]}
    p ([0] + a_ary[i + 1]).rotate(i + 1)
  }
end

A0([1, 1, 1, 2, 1], 6)
p ''
A0([1, 1, 1, 3, 2, 1], 7)
p ''
f([1, 1, 1, 2, 1], 6)
p ''
f([1, 1, 1, 3, 2, 1], 7)
