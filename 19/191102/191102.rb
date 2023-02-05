def A(n)
  a = [[0, 0]]
  # 爪楊枝の上にある格子点の個数
  g = [0]
  # 次のステップで置く爪楊枝の真ん中
  b = [[0, 0]]
  s = 0
  ary = [0]
  (1..n).each{|i|
    c = []
    s += b.size
    ary << s
    b.each{|j|
      k, l = i % 2, (i + 1) % 2
      c << [j[0] + k, j[1] + l]
      c << [j[0] - k, j[1] - l]
    }
    b = c.group_by(&:to_a).select{|k, v| v.size == 1}.keys - a
    a += c
    a.uniq!
    g << a.size
  }
  p g
  ary
end

p A(20)
