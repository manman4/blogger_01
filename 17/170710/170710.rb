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

# ary[0]を計算の都合上上手く利用
def qdEE(k, n)
  ary = [1]
  a = E0_2k(k, n)
  (1..n).each{|i|
    ary << (1..i).inject(0){|s, j| s - a[j] * ary[-j]}
    ary[0] += 1
  }
  # qE'/Eを出力
  p ary[1..-1]
  ary
end

def A008683(n)
  ary = n.prime_division
  return (-1) ** (ary.size % 2) if ary.all?{|i| i[1] == 1}
  0
end

def A(k, n)
  a = qdEE(k, n)
  m_ary = [0] + (1..n).map{|i| A008683(i)}
  ary = []
  (1..n).each{|i|
    s = 0
    (1..i).each{|j|
      s += m_ary[i / j] * a[j] if i % j == 0
    }
    ary << s / i
  }
  ary
end

n = 20
(1..7).each{|k| p [2 * k, A(k, n)]}
