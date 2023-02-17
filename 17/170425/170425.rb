n = 50

ary = []
(1..n).each{|j|
  p j
  s = 0
  (1..Math.sqrt(j).to_i).each{|k|
    m = Math.sqrt(j - k * k).to_i
    if m * m == j - k * k
      x = (k + m * 1i) ** 4
      s += x
      p [k, m, x]
    end
  }
  ary << s.real
}
p ary
