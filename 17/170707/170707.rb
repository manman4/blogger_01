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

def bernoulli(n)
  ary = []
  a = []
  (0..n).each{|i|
    a << 1r / (i + 1)
    i.downto(1){|j| a[j - 1] = j * (a[j - 1] - a[j])}
    ary << a[0] # Bn = a[0]
  }
  ary
end

def E0_2k(k, n)
  a = -4 * k / bernoulli(2 * k)[-1]
  [1] + (1..n).map{|i| a * sigma(2 * k - 1, i)}
end

# ary[0] = 1
def sqrt_a(ary)
  n = ary.size - 1
  a = [1]
  (0..n - 1).each{|i| a << (ary[i + 1] - (1..i).inject(0){|s, j| s + a[j] * a[-j]}) / 2}
  a
end

def A(k, m, n)
  ary = E0_2k(k, n)
  m.times{ary = sqrt_a(ary)}
  ary
end

n = 20
(1..2).each{|m|
  (1..7).each{|k|
    p [2 * k, 1r / 2 ** m, A(k, m, n)]
  }
}
