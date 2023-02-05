def A(a1, a2, a3, a4, k, l, n)
  a, b, c, d = a1, a2, a3, a4
  ary = [a1]
  while ary.size < n
    break if (k * b * d + l * c * c) % a > 0
    a, b, c, d = b, c, d, (k * b * d + l * c * c) / a
    ary << a
  end
  ary
end

def x(s, t, u, v, k, l)
  a, b = s * s * v * v + k * (s * u ** 3 + t ** 3 * v) + l * t * t * u * u, s * t * u * v
  return false if a % b > 0
  a / b
end

def Diophantine(s, t, u, v, k, l, x)
  s * s * v * v + k * (s * u ** 3 + t ** 3 * v) + l * t * t * u * u == x * s * t * u * v
end

# a1, a2, a3, a4, k, lを以下のように定める
def f(a, c, d, e)
  return false if (a ** 3 * d + e * e) % c > 0
  return 1, a, e * e, c * e ** 3, e ** 3, a * d * e ** 3
end

def g(a1, a2, a3, a4, k, l, n)
  p ary = A(a1, a2, a3, a4, k, l, n)
  x = x(a1, a2, a3, a4, k, l)
  p (0..n - 4).map{|i| Diophantine(ary[i], ary[i + 1], ary[i + 2], ary[i + 3], k, l, x)} if x != false
end

def h(a, c, d, e, n)
  f = f(a, c, d, e)
  g(*f, n) if f != false
end

n = 20
# テスト用
h(3, 133, 30, 11, n)

# f(a, c, d, e)がfalseのときは何も出力されない
(1..3).each{|a|
  (1..3).each{|c|
    (1..3).each{|d|
      (1..3).each{|e|
        h(a, c, d, e, n)
      }
    }
  }
}

