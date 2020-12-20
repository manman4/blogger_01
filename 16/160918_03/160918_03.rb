def bernoulli(n)
  ary = []
  a = []
  (0..n).each{|i|
    a << 1r / (i + 1)
    i.downto(1){|j| a[j - 1] = j * (a[j - 1] - a[j])}
    p [i, a]
    ary << a[0] # Bn = a[0]
  }
  p 'Bernoulli number'
  ary
end

p bernoulli(40)

