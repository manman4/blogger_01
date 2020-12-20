def s(n)
  s = 0
  (1..n).each{|i| s += i if n % i == 0}
  s
end

def A(k, n)
  ary = [1]
  a = [0] + (1..n).map{|i| s(i)}
  (1..n).each{|i| ary << (1..i).inject(0){|s, j| s - k * a[j] * ary[-j]} / i}
  ary
end

n = 15
-24.upto(24){|i| p [i, A(i, n)]}

