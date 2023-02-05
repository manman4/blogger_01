def A(a1, a2, a3, a4, a5, k, l, n)
  a, b, c, d, e = a1, a2, a3, a4, a5
  ary = [a1]
  while ary.size < n
    break if (k * b * e + l * c * d) % a > 0
    a, b, c, d, e = b, c, d, e, (k * b * e + l * c * d) / a
    ary << a
  end
  ary
end

def x(s, t, u, v, w, k, l)
  a, b = (s * w + k * u * u) * (s * v * v + t * t * w) + l * t * u ** 3 * v, s * t * u * v * w
  return false if a % b > 0
  a / b
end

def Diophantine(s, t, u, v, w, k, l, x)
  (s * w + k * u * u) * (s * v * v + t * t * w) + l * t * u ** 3 * v == x * s * t * u * v * w
end

def f(a1, a2, a3, a4, a5, k, l, n)
  p ary = A(a1, a2, a3, a4, a5, k, l, n)
  p x = x(a1, a2, a3, a4, a5, k, l)
  p (0..n - 5).map{|i| Diophantine(ary[i], ary[i + 1], ary[i + 2], ary[i + 3], ary[i + 4], k, l, x)} if x != false
end

n = 20
# テスト用
a1, a2, a3, a4, a5, k, l = 1, 1, 1, 1, 3, 1, 1
f(a1, a2, a3, a4, a5, k, l, n)

a1, a2, a3, a4, a5, k, l = 1, 1, 1, 1, 1, 1, 1
f(a1, a2, a3, a4, a5, k, l, n)

a1, a2, a3, a4, a5, k, l = 1, 1, 33, 6655, 19487171, 14641, 1771561
f(a1, a2, a3, a4, a5, k, l, n)

