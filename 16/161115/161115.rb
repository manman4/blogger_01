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
  ary = bernoulli(2 * n)
  (1..n).map{|i| -4 * i / ary[2 * i]}
end

n = 100
p A(n)

