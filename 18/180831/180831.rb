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

def A(n)
  a = bernoulli(2 * n + 2)
  ary = [1]
  (1..n).each{|i|
    ary << -1r / (2 * i) * (0..i - 1).inject(0){|s, j| s + a[2 * (i - j) + 2] * ary[j] / ((2 * (i - j) + 1r) * (2 * (i - j) + 2))}
  }
  ary
end

p A(20)
