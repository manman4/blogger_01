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

def I(ary, n)
  a = [1]
  i = 0
  while i < n
    a << -(0..i).inject(0){|s, j| s + ary[1 + i - j] * a[j]}
    i += 1
  end
  a
end

def s(n)
  s = 0
  (1..n).each{|i| s += i if n % i == 0}
  s
end

def A000594(n)
  ary = [1]
  a = [0] + (1..n - 1).map{|i| s(i)}
  (1..n - 1).each{|i| ary << (1..i).inject(0){|s, j| s - 24 * a[j] * ary[-j]} / i}
  ary
end

def A(n)
  a = E_2k(1, n)
  b = E_2k(2, n)
  c = E_2k(3, n)
  d = mul(a, b, n)
  e = (1..n).map{|i| d[i] - c[i]}
  r = A000594(n)
  mul(mul(e, e, n - 1), I(r, n - 1), n - 1)
end

def A00_4(n)
  ary = [1] + [0] * n
  (1..n).each{|i|
    j = i * i
    break if j > n
    ary[j] = 2
  }
  power(ary, 4, n)
end

def A01_4(n)
  ary = [1] + [0] * n
  (1..n).each{|i|
    j = i * i
    break if j > n
    ary[j] = (-1) ** (i % 2) * 2
  }
  power(ary, 4, n)
end

def A10_4(n)
  ary = [1] + [0] * n
  (1..n).each{|i|
    j = i * (i + 1)
    break if j > n
    ary[j] = 1
  }
  power(ary, 4, n)
end

# -2～n-2 
def A319294(n)
  a = A00_4(n)
  b = A01_4(n)
  c = A10_4(n)
  d = (0..n).map{|i| a[i] + b[i]}
  e = I(mul(c, c, n), n)
  f = mul(d, e, n).map{|i| i / 2}
  g = [1] + (1..n).map{|i| b[i] - 16 * c[i - 1]}
  h = mul(g, I(mul(a, a, n), n), n).map{|i| i * 128}
  ([1, 0] + (2..n).map{|i| f[i] + h[i - 2]})[0..n]
end

n = 50
p a = A(n)
p A319294(n + 2)

# A281373
p a.map{|i| i / 518400}

