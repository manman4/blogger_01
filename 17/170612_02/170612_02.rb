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

def A000203(n)
  s = 0
  (1..n).each{|i| s += i if n % i == 0}
  s
end

def A006353(n)
  a = [0] + (1..n).map{|i| A000203(i)}
  ary = [1]
  (1..n).each{|i|
    ary[i] = 5 * a[i]
    ary[i] -=  2 * a[i / 2] if i % 2 == 0
    ary[i] +=  3 * a[i / 3] if i % 3 == 0
    ary[i] -= 30 * a[i / 6] if i % 6 == 0
  }
  ary
end

def Apery(a, b, n)
  i = 0
  ary = [a]
  while i < n
    i += 1
    a, b = b, ((((34 * i + 51) * i + 27) * i + 5) * b - i ** 3 * a) / (i + 1r) ** 3
    a = a.to_i if a.denominator == 1
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

def f(n)
  [0] + A([[1, 12], [6, 12], [2, -12], [3, -12]], n)[0..-2]
end

def S(c_ary, x_ary, n)
  ary = Array.new(n + 1, 0)
  tq = x_ary
  tqn = [1] + Array.new(n, 0)
  (0..c_ary.size - 1).each{|i|
    (0..n).each{|j|
      ary[j] += c_ary[i] * tqn[j]
    }
    # 計算の途中経過を表示
    p [c_ary[i], (0..8).map{|j| tqn[j]}] if i < 9
    tqn = mul(tqn, tq, n)
  }
  ary
end

def A001158(n)
  s = 0
  (1..n).each{|i| s += i * i * i if n % i == 0}
  s
end

def g(n)
  a = [0] + (1..n).map{|i| A001158(i)}
  ary = a.clone
  (1..n).each{|i|
    ary[i] -= 28 * a[i / 2] if i % 2 == 0
    ary[i] += 63 * a[i / 3] if i % 3 == 0
    ary[i] -= 36 * a[i / 6] if i % 6 == 0
  }
  [0] + (1..n).map{|i| ary[i] / (i ** 3).to_r}
end

n = 20
x_ary = f(n)
p a = A006353(n)
p ary1 = S(Apery(1, 5, n), x_ary, n)
p a == ary1

p b = g(n)
# 6*f(q)*g(q)
p c = mul(a, b, n).map{|i| i * 6}
p ary2 = S(Apery(0, 6, n), x_ary, n)
p c == ary2

