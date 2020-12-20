def s(k, n)
  s = 0
  (1..n).each{|i| s += (n / i) * k ** (i - 1) * (1 - (-1) ** (i % 2)) if n % i == 0}
  s
end

def A(k, n)
  ary = [1]
  p a = (0..n).map{|i| s(k, i)}
  (1..n).each{|i| ary << (1..i).inject(0){|s, j| s + a[j] * ary[-j]} / i.to_r}
  ary
end

n = 32
(1..n).each{|i|
  p i
  ary = A(i, n)
  ary = ary.map(&:to_i) if ary.all?{|i| i.denominator == 1}
  p ary
}

