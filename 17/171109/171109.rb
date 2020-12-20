def s(k, n)
  s = 0
  (1..n).each{|i| s += i ** (1 + k * n) if n % i == 0}
  s
end

def A(k, l, n)
  a_ary = [1]
  a = [0] + (1..n).map{|i| s(k, i)}
  (1..n).each{|i| a_ary << l * (1..i).inject(0){|s, j| s + a[j] * a_ary[-j]} / i}
  a_ary
end

p A(1, -1, 50)
p A(1,  1, 50)

