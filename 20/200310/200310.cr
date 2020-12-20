require "big"

def a(n)
  cnt = 0
  (1..n).to_a.each_permutation{|i|
    cnt += 1 if (1..n).map{|j| i[j - 1] / j.to_big_r}.uniq.size == n
  }
  cnt
end

def a333082(n)
  (0..n).map{|i| a(i)}
end

p a333082(10)

