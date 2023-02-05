def ncr(n, r)
  return 1 if r == 0
  (n - r + 1..n).inject(:*) / (1..r).inject(:*)
end

def nhr(n, r)
  ncr(n + r - 1, r)
end

n = 50
(1..n).each{|i|
  k = (0..i).inject(0){|s, j| s + ncr(i, j) ** 2 * nhr(2 * i, 2 * i - j)}
  p [i, k, k == 5 * ncr(3 * i - 1, i - 1) ** 2]
}
