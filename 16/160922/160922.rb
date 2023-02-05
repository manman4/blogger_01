def A(k, n)
  p [a = Array.new(n + 1, 1), a.size]
  return if k == 0
  p [b = (1..n).to_a, b.size]
  return if k == 1
  2.upto(k){|i|
    c = (0..n - i).map{|j| (b[j] * b[j + 1] - 1) / a[j + 1]}
    a, b = b, c
    p [b, b.size]
  }
end

n = 15
A(4, n)
p ''
A(n, n)
