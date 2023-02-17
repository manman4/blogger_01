def s(f_ary, g_ary, n)
  s = 0
  (1..n).each{|i| s += i * f_ary[i] * g_ary[i] ** (n / i) if n % i == 0}
  s
end

def A(f_ary, g_ary, n)
  ary = [1]
  a = [0] + (1..n).map{|i| s(f_ary, g_ary, i)}
  (1..n).each{|i| ary << (1..i).inject(0){|s, j| s + a[j] * ary[-j]} / i}
  ary
end

n = 50
ary1 = (0..n).map{|i| -i}
ary2 = (0..n).to_a
p A(ary1, ary1, n)
p A(ary1, ary2, n)
p A(ary2, ary1, n)
p A(ary2, ary2, n)
