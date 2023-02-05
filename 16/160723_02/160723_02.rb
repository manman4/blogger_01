def D(ary)
  m = ary.size
  a_ary = [ary]
  p a_ary[0]
  i = 0
  while i == 0 || a_ary[i] != ary
    a_ary << Array.new(m, 1)
    (m - 2).downto(3){|j| a_ary[i + 1][j] = (a_ary[i][j - 1] * a_ary[i + 1][j + 1] + 1) / a_ary[i][j]}
    a_ary[i + 1][2] = (a_ary[i][0] * a_ary[i][1] * a_ary[i + 1][3] + 1) / a_ary[i][2]
    a_ary[i + 1][1] = (                            a_ary[i + 1][2] + 1) / a_ary[i][1]
    a_ary[i + 1][0] = (                            a_ary[i + 1][2] + 1) / a_ary[i][0]
    p a_ary[i + 1]
    i += 1
  end
end

def C(ary)
  m = ary.size
  a_ary = [ary]
  p a_ary[0]
  i = 0
  while i == 0 || a_ary[i] != ary
    a_ary << Array.new(m, 1)
    (m - 2).downto(2){|j| a_ary[i + 1][j] = (a_ary[i][j - 1] * a_ary[i + 1][j + 1] + 1) / a_ary[i][j]}
    a_ary[i + 1][1] = (a_ary[i][0] * a_ary[i][0] * a_ary[i + 1][2] + 1) / a_ary[i][1]
    a_ary[i + 1][0] = (                            a_ary[i + 1][1] + 1) / a_ary[i][0]
    p a_ary[i + 1]
    i += 1
  end
end

D([7, 7, 27, 5, 3, 1])
p ''
C([7, 27, 5, 3, 1])
p ''
D([4, 4, 3, 2, 1])
p ''
C([4, 3, 2, 1])
