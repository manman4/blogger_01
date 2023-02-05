require 'prime'

def A(k, l, m, n)
  a = Array.new(k * 2, 1)
  ary = [1]
  while ary.size < n + 1
    break if (l * a[k] + m * a[1] * a[-1]) % a[0] > 0
    a = *a[1..-1], (l * a[k] + m * a[1] * a[-1]) / a[0]
    ary << a[0]
  end
  ary
end

# 特性方程式の係数の絶対値が1より大きいもの
def c(k, l)
  k * (k - 1) / 2 * l * l + (4 * k - 2) * l + 3
end

def berlekamp_massey(s, q)
  b, c = [1], [1] + [0] * (s.size - 1)
  l, m, a = 0, -1, 1
  s.size.times do |n|
    d = (0..l).inject(0) {|sum, i| (sum + c[i] * s[n - i]) % q}
    next if d == 0
    t = c[0..l]
    (0...[s.size - n + m, b.size].min).each do |j|
      c[n - m + j] = (c[n - m + j] - d * a * b[j]) % q
    end
    b, l, m, a = t, n + 1 - l, n, mod_inv(d, q) if 2 * l <= n
  end
  c[0..l]
end

def euclid(a, b)
  return [0, 1] if a == 0
  q, r = b.divmod(a)
  x, y = euclid(r, a)
  [y - q * x, x]
end

# x^(-1) (mod n)
def mod_inv(x, n)
  euclid(x, n)[0]
end

# x % n1 = r1, x % n2 = r2, |x| <= n1 * n2 / 2 となる x
def chinese(n1, r1, n2, r2)
  x = (n1 * (r2 - r1) * mod_inv(n1, n2) + r1) % (n = n1 * n2)
  2 * x > n ? x - n : x
end

# f を多項式として f=0 が数列 s を生成する漸化式の特性方程式となっているか
def test(f, s)
  (0..s.size - f.size).all? do |i|
    f.each_with_index.inject(0) {|sum, (fj, j)|
      sum + fj * s[f.size + i - j - 1]
    } == 0
  end
end

# 数列 s を生成する漸化式の特性方程式を返す
def polynomial(s)
  f, n = [], 1
  Prime.each do |q|
    c = berlekamp_massey(s, q)
    if c.size != f.size then
      f, n = c, q if c.size > f.size
      next
    end
    f = (0...f.size).map {|i| chinese(n, f[i], q, c[i])}
    return f if test(f, s)
    n *= q
  end
end

i = 7
n = 150
(1..i).each{|k|
  (1..i).each{|l|
    (1..i).each{|m|
      ary = A(k, l, m, n)
      if ary.size == n + 1
        p [[k, l, m], c(k, l), polynomial(ary)]
        p ary[0..50]
      end
    }
  }
}
