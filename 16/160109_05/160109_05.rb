def f(k, n, c)
  m = (k * 10 ** ((c - 1) * n)) % c
  return (k * 10 ** ((c - 1) * n) - m) / c
end

n = 3
p ary = (0..n).inject([]){|s, i| s + (1..16).map{|k| f(k, i, 17)}}.uniq!.sort
# それぞれj倍したもの
ary.each{|i| p (1..16).map{|j| i * j}}
