def f(k, n, c)
  m = (k * 10 ** ((c - 1) * n)) % c
  return (k * 10 ** ((c - 1) * n) - m) / c
end

n = 2
# 7は除きました。また、出力結果が多くなるので97以降も除きました。
c_ary = [17, 19, 23, 29, 47, 59, 61]
ary = []
c_ary.each{|c|
  ary += (0..n).inject([]){|s, i| s + (1..c - 1).map{|k| f(k, i, c)}}.uniq!.sort
}
p ary.uniq!.sort
