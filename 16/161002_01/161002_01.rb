require 'prime'

def A(a3, a2, a4, a6, n)
  ary = []
  Prime.take(n).each{|p|
    a = Array.new(p, 0)
    (0..p - 1).each{|i| a[(i * i + a3 * i) % p] += 1}
    ary << (0..p - 1).inject(0){|s, i| s + a[(i * i * i + a2 * i * i + a4 * i + a6) % p]}
  }
  ary
end

n = 15000
ary = A(0, 0, 0, -432, n)
p ary == A(1, 0, 0, -7, n)
