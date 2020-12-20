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

def E_2k(k, n)
  a = -4 * k / bernoulli(2 * k)[-1]
  b = a.denominator
  c = a.numerator
  [b] + (1..n).map{|i| c * sigma(2 * k - 1, i)}
end

# m次以下を取り出す
def mul(f_ary, b_ary, m)
  s1, s2 = f_ary.size, b_ary.size
  ary = Array.new(s1 + s2 - 1, 0)
  (0..s1 - 1).each{|i|
    (0..s2 - 1).each{|j|
      ary[i + j] += f_ary[i] * b_ary[j]
    }
  }
  ary[0..m]
end

# m次以下を取り出す
def power(ary, n, m)
  return [1] if n == 0
  k = power(ary, n >> 1, m)
  k = mul(k, k, m)
  return k if n & 1 == 0
  return mul(k, ary, m)
end

def A(a, b, c, s, t, u, n)
  mul(mul(power(a, s, n), power(b, t, n), n), power(c, u, n), n)
end

def A126858(a, b, c, n)
  a1 = A(a, b, c, 3, 0, 0, n)
  a2 = A(a, b, c, 1, 1, 0, n)
  a3 = A(a, b, c, 0, 0, 1, n)
  (0..n).map{|i| (5 * a1[i] - 3 * a2[i] - 2 * a3[i]) / 51840}
end

def F_3(a, b, c, n)
  a1 = A(a, b, c, 4, 1, 0, n)
  a2 = A(a, b, c, 6, 0, 0, n)
  a3 = A(a, b, c, 2, 2, 0, n)
  a4 = A(a, b, c, 0, 3, 0, n)
  a5 = A(a, b, c, 3, 0, 1, n)
  a6 = A(a, b, c, 1, 1, 1, n)
  a7 = A(a, b, c, 0, 0, 2, n)
  (0..n).map{|i| (15 * a1[i] - 6 * a2[i] - 12 * a3[i] + 7 * a4[i] + 4 * a5[i] - 12 * a6[i] + 4 * a7[i]) / 35831808r}
end

n = 100
a = E_2k(1, n)
b = E_2k(2, n)
c = E_2k(3, n)
p A126858(a, b, c, n)
p F_3(a, b, c, n)

