def s(k, n)
  s = 0
  (1..n).each{|i| s += i if n % i == 0 && i % k == 0}
  s
end

def A(ary, n)
  a_ary = [1]
  a = [0] + (1..n).map{|i| ary.inject(0){|s, j| s + j[1] * s(j[0], i)}}
  (1..n).each{|i| a_ary << (1..i).inject(0){|s, j| s - a[j] * a_ary[-j]} / i}
  a_ary
end

def B(k, n)
  a = A([[2, 5 * k], [1, -2 * k], [4, -2 * k]], 2 * n)
  (0..n).map{|i| a[2 * i]}
end

n = 20
(1..96).each{|i| p [i, B(i, n)]}
