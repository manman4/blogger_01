def f(k, n)
  m = (k * 10 ** (18 * n)) % 19
  return (k * 10 ** (18 * n) - m) / 19
end

n = 6
p ary = (0..n).inject([]){|s, i| s + (1..9).map{|k| f(k, i)}}.uniq!.sort
# それぞれj倍したもの
ary.each{|i| p (1..9).map{|j| i * j}}
