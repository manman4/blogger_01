def s(k, n)
  s = 0
  (1..n).each{|i| s += i if n % i == 0 && i % k == 0}
  s
end

def A186690_1(n)
  (1..n).map{|i| s(1, i) - 5 * s(2, i) / 2 + s(4, i)}
end

def A186690_2(n)
  ary = []
  (1..n).each{|i|
    j = s(1, i)
    j -= s(1, i / 2) if i % 2 == 0
    ary << (-1) ** (i % 2 + 1) * j
  }
  ary
end

n = 1000
p ary = A186690_1(n)
p ary == A186690_2(n)

