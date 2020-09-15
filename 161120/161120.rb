# (a, b)が曲線上に存在するか？
def f(a, b)
  b * b + b == a * a * a - a
end

# A028940 / A028941, -A028942 / A028943
def A(n)
  p [1, [0, 0], f(0, 0)]
  a, b = 1r, 0r
  (2..n).each{|i|
    p [i, [a, b], f(a, b)]
    c = (b * b - a * a * a) / (a * a)
    d = -1 - b * c / a
    a, b = c, d
  }
end

n = 50
A(n)

