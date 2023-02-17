require 'prime'

def power0(a, n)
  return 1 if n == 0
  k = power0(a, n >> 1)
  k *= k
  return k if n & 1 == 0
  return k * a
end

# x > 0
def sigma(x, i)
  sum = 1
  pq = i.prime_division
  pq.each{|a, n| sum *= (power0(a, (n + 1) * x) - 1) / (power0(a, x) - 1)}
  sum
end

def A000521(n)
  s3 = [0] + (1..n + 1).map{|i| sigma(3, i)}
  s5 = [0] + (1..n + 1).map{|i| sigma(5, i)}
  ary = [1]
  (0..n).each{|i| ary << (1..i + 1).inject(0){|s, j| s + (504 * s5[j] - 240 * (i - j) * s3[j]) * ary[-j]} / (i + 1)}
  ary
end

n = 50
p A000521(n)
