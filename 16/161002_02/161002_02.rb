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

m = 4
n = 25
ary = []
a = []
(1..m * 64).each{|i|
  j = A(0, 0, 0, -i, n)
  if !ary.include?(j)
    ary << j
    p [i, j]
  else
    a << i
  end
}
p a

n = 200
(1..m).each{|i| p A(0, 0, 0, -i, n) == A(0, 0, 0, -i * 64, n)}

