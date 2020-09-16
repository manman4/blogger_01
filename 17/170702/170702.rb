require 'prime'

def A005259(n)
  i = 0
  a, b = 1, 5
  ary = [1]
  while i < n
    i += 1
    a, b = b, ((((34 * i + 51) * i + 27) * i + 5) * b - i ** 3 * a) / (i + 1) ** 3
    ary << a
  end
  ary
end

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

n = 300
a = Prime.take(n + 1).to_a
a.shift

ary0 = A005259(a[-1])
p ary01 = a.map{|i| ary0[(i - 1) / 2] % i}
p ary02 = a.map{|i| ary0[(i - 1) / 2] % (i * i)}

ary1 = A([[1, 4], [2, 4]], a[-1])
p ary01 == a.map{|i| ary1[(i - 1) / 2] % i}
p ary02 == a.map{|i| ary1[(i - 1) / 2] % (i * i)}

