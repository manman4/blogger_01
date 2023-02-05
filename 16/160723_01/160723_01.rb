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

D([10, 5, 29, 8, 3, 1])
p ''
D([5, 10, 29, 8, 3, 1])
p ''
D([3, 6, 5, 2, 1])
p ''
D([6, 3, 5, 2, 1])

