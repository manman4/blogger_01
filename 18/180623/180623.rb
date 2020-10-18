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

# 1/t^(2n-1)の係数
def RiemannSiegelTheta_infty(n)
  a = bernoulli(2 * n)
  (1..n).map{|i| (1 - 1r / 2 ** (2 * i - 1)) * a[2 * i].abs / (4 * i * (2 * i - 1))}
end

n = 50
ary = RiemannSiegelTheta_infty(n)
(1..n).each{|i| p [-(2 * i - 1), ary[i - 1]]}

