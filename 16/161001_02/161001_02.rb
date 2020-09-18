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

n = 500
p ary = A(1, -1, -40, -221, n)
p ary == A(1, -1,   -1250,     31239, n)
p ary == A(1, -1, -946260, 354609639, n)

p ary = A(1, -1, -7, 10, n)
p ary == A(1, -1, -887, -10143, n)

