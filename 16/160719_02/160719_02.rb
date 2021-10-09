n = 20
# 1行目
a = [0, 1]
n.times{|i|
  a << 0
  b = [0]
  (0..i).each{|j| b[j + 1] = a[j] + a[j + 1] + b[j]}
  a = b
  p [i + 1, a[1..-1]]
}
