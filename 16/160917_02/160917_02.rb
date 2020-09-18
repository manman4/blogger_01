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

n = 100
p A(1, -1, -10, -20, n) # 最初の項だけA272196と異なる
p A(0,  1,   4,   4, n)
p A(0, -1,  -4,   4, n)
p A(1,  0,   0,  -7, n)
p A(0,  0,   4,   0, n)
p A(0,  0,   0,   1, n)
p A(0,  1,  -4,  -4, n)
p A(0,  0,  -4,   0, n)
p A(0, -1,   4,  -4, n)
p A(0,  0,   0,  -1, n)

