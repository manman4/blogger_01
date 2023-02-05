def A1(ary)
  m = ary.size
  a_ary = [ary]
  p a_ary[0]
  i = 0
  while i == 0 || a_ary[i] != ary
    a_ary << Array.new(m, 1)
    (m - 2).downto(1){|j| a_ary[i + 1][j] = (a_ary[i][j - 1] * a_ary[i + 1][j + 1] + 1) / a_ary[i][j]}
    p a_ary[i + 1]
    i += 1
  end
  a_ary.uniq!
end

p 3
a = []
[[1, 1]].each{|i|
  a += A1(i)
  p ""
}
p "#{a.uniq.size} = 1"
p ""
p 4
a = []
[[1, 1, 1]].each{|i|
  a += A1(i)
  p ""
}
p "#{a.uniq.size} = 2"
p ""
p 5
a = []
[[1, 1, 1, 1]].each{|i|
  a += A1(i)
  p ""
}
p "#{a.uniq.size} = 5"
p ""
p 6
a = []
[[1, 1, 1, 1, 1],
 [1, 3, 2, 1, 1],
 [1, 1, 2, 3, 1],
 [1, 1, 2, 1, 1]].each{|i|
  a += A1(i)
  p ""
}
p "#{a.uniq.size} = 6 + 3 + 3 + 2"
p ""
p 7
a = []
[[1, 1, 1, 1, 1, 1],
 [1, 4, 3, 2, 1, 1],
 [1, 1, 2, 3, 4, 1],
 [1, 1, 2, 1, 1, 1],
 [1, 1, 1, 2, 1, 1],
 [1, 2, 1, 1, 2, 1]].each{|i|
  a += A1(i)
  p ""
}
p "#{a.uniq.size} = 7 + 7 + 7 + 7 + 7 + 7"
