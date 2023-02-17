def s(k, n)
  s = 0
  (1..n).each{|i| s += i if n % i == 0 && i % k == 0}
  s
end

def A(k, n)
  ary = [1]
  a = [0] + (1..n).map{|i| 2 * s(2, i) - s(1, i)}
  (1..n).each{|i| ary << (1..i).inject(0){|s, j| s - k * a[j] * ary[-j]} / i}
  ary
end

m = 3
n = 10 ** m
(1..100).each{|i|
  a = A(i, n)
  p [i, (0..m).map{|j| a[10 ** j]}]
}

