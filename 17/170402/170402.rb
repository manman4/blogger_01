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

def p0(n)
  (3 * n * n - n) / 2
end

def p1(n)
  (3 * n * n + n) / 2
end

def A010815(n)
  ary = Array.new(n + 1, 0)
  ary[0] = 1
  i = 1
  j = p0(i)
  while j <= n
    ary[j] = (-1) ** i
    i += 1
    j = p0(i)
  end
  i = 1
  j = p1(i)
  while j <= n
    ary[j] = (-1) ** i
    i += 1
    j = p1(i)
  end
  ary
end

# m次以下を取り出す
def power(ary, n, m)
  return [1] if n == 0
  k = power(ary, n >> 1, m)
  k = mul(k, k, m)
  return k if n & 1 == 0
  return mul(k, ary, m)
end

def f(ary, k, n)
  aryk = Array.new(n + 1, 0)
  (0..n / k).each{|i| aryk[k * i] = ary[i]}
  aryk
end

def A(k, n)
  ary = A010815(n)
  aryk = power(ary, k, n)
  ps = Array.new(n + 1, 0)
  ps[0] = 1
  (1..n).each{|num|
    (num..n).each{|i|
      ps[i] += ps[i - num]
    }
  }
  psk = f(ps, k, n)
  mul(aryk, psk, n)
end

def A109091_1(n)
  ary = A(5, n)
  (1..n).map{|i| - ary[i] / 5}
end

def s(k, m, n)
  s = 0
  (1..n).each{|i| s += i if n % i == 0 && i % k == m}
  s
end

def A109091_2(n)
  (1..n).map{|i| s(5, 1, i) + s(5, 4, i) - s(5, 2, i) - s(5, 3, i)}
end

n = 1000
p ary = A109091_1(n)
p ary == A109091_2(n)
