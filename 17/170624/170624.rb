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

def S(c_ary, x_ary, n)
  ary = Array.new(n + 1, 0)
  tq = x_ary
  tqn = [1] + Array.new(n, 0)
  (0..c_ary.size - 1).each{|i|
    (0..n).each{|j|
      ary[j] += c_ary[i] * tqn[j]
    }
    tqn = mul(tqn, tq, n)
  }
  ary
end

def I(ary, n)
  a = [1]
  (0..n - 1).each{|i| a << -(0..i).inject(0){|s, j| s + ary[1 + i - j] * a[j]}}
  a
end

def A008683(n)
  ary = n.prime_division
  return (-1) ** (ary.size % 2) if ary.all?{|i| i[1] == 1}
  0
end

def A(k, m, n)
  a = I(E0_2k(k, n), n)
  b = E0_2k(k + 1, n)
  # E_{2k+2}/E_{2k}を出力
  p c = mul(a, b, n)
  m_ary = [0] + (1..n).map{|i| A008683(i)}
  ary = []
  (1..n).each{|i|
    s = 0
    (1..i).each{|j|
      s += m_ary[i / j] * c[j] if i % j == 0
    }
    ary << m + m * s / (24 * i)
  }
  ary
end

# c_ary は1次から
def T(c_ary, n)
  ary = Array.new(n + 1, 0)
  tq = [0] + (1..n).map{|i| -1r / i}
  (1..c_ary.size).each{|i|
    tqn = Array.new(n + 1, 0)
    (0..n / i).each{|j| tqn[i * j] = tq[j]}
    (0..n).each{|j|
      ary[j] += c_ary[i - 1] * tqn[j]
    }
  }
  ary
end

# 二通りで求め、一致することを確認
def f(k, m, n)
  p 2 * k
  x_ary = E0_2k(k, n)
  x_ary[0] = 0
  p s_ary = S(@c_ary, x_ary, n)
  p t_ary = T(A(k, m, n), n)
  p s_ary == t_ary
end

n = 10
@c_ary = [0] + (1..n).map{|i| (-1) ** (i % 2 + 1) * 1r / i}
f(1, 2, n)
f(2, 8, n)
f(3, 12, n)
f(4, 16, n)
f(6, 24, n)

