def c(n, r)
  return 1 if r == 0
  return c(n, n - r) if r > n - r
  (n - r + 1..n).inject(:*) / (1..r).inject(:*)
end

def bernoulli_0(n)
  return 1r / 2 if n == 1
  return 0 if n % 2 == 1
  a = [1r]
  (1..n / 2).each{|i| a << 1r / 2 - (0..i - 1).inject(0){|s, j| s + c(2 * i + 1, 2 * j) * a[j]} / (2 * i + 1)}
  a[-1]
end

def bernoulli_1(n)
  return 1r / 2 if n == 1
  return 0 if n % 2 == 1
  a = []
  (0..n).each{|i|
    a << 1r / (i + 1)
    i.downto(1){|j| a[j - 1] = j * (a[j - 1] - a[j])}
  }
  a[0]
end

def bernoulli_2(n)
  return 1r / 2 if n == 1
  return 0 if n % 2 == 1
  a = [1, 1r / 6]
  (2..n / 2).each{|i| a << - (1..i - 1).inject(0){|s, j| s + c(2 * i, 2 * j) * a[i - j] * a[j]} / (2 * i + 1)}
  a[n / 2]
end

n = 100
p ary0 = (0..n).map{|i| bernoulli_0(i)}
p ary0 == (0..n).map{|i| bernoulli_1(i)}
p ary0 == (0..n).map{|i| bernoulli_2(i)}
