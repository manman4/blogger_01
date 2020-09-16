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

n = 20
p b_ary = bernoulli(2 * n)
p ''
(2..n).each{|i|
  x = i + 1
  p [i, x == (0..i).inject(0){|s, j| s + ncr(i + 1, j) * b_ary[j]}, x]
}
p ''
(2..n).each{|i|
  x = -(i + 1) * b_ary[i]
  p [i, x == (2..i - 2).inject(0){|s, j| s + ncr(i, j) * b_ary[j] * b_ary[i - j]}, x]
}
p ''
(2..n).each{|i|
  x = i * (i + 1) * b_ary[i]
  p [i, x == (i + 2) * (2..i - 2).inject(0){|s, j| s + b_ary[j] * b_ary[i - j]} - 2 * (2..i - 2).inject(0){|s, j| s += ncr(i + 2, j) * b_ary[j] * b_ary[i - j]}, x]
}

