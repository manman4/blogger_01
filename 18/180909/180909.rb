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

def ncr(n, r)
  return 1 if r == 0
  (n - r + 1..n).inject(:*) / (1..r).inject(:*)
end

# k は奇数
def A(k, n)
  a = bernoulli(2 * n + k + 1)
  ary = [1]
  (1..n).each{|i|
    ary << -1 / (2r * i) * (0..i - 1).inject(0){|s, j| s + a[2 * i - 2 * j + k + 1] * ary[j] / (ncr(2 * i - 2 * j + k, k) * (2 * i - 2 * j + k + 1r))}
  }
  ary
end

n = 15
(0..10).each{|i| p [2 * i + 1, A(2 * i + 1, n)]}

