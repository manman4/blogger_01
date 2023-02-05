def ncr(n, r)
  return 1 if r == 0
  (n - r + 1..n).inject(:*) / (1..r).inject(:*)
end

def A(k, n)
  (1..n).map{|i| (0..i).inject(0){|s, j| s + (ncr(i, j) * ncr(i + j, j + 1)) ** k} / 2}
end

def B(k, n)
  ary = [1]
  (1..n).each{|i|
    x = (0..i).inject(0){|s, j| s + (ncr(i, j) * ncr(i + j, j + 1)) ** k}
    break if x % (i ** k) > 0
    ary << x / (i ** k)
  }
  ary
end

def C(n)
  (1..n).map{|i| (0..i).map{|j| ncr(i, j) * ncr(i + j, j + 1)}}
end

m = 5
n = 30
# A050151, A277060
(1..m).each{|i| p [i, A(i, n)]}
# A006318, A074635
(1..m).each{|i| p [i, B(i, n)]}
p C(n)
