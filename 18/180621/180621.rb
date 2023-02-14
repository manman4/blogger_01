require 'prime'

def f(n)
  return 1 if n < 2
  (1..n).inject(:*)
end

def A003557(n)
  s = 1
  n.prime_division.each{|i| s *= i[0] ** (i[1] - 1)}
  s
end

def A(a, k, n)
  [1] + (1..n).map{|i| (k / a) ** i * (0..i - 1).inject(1){|s, j| s * (a * j - 1)} / f(i)}
end

n = 6
(1..1728).each{|i|
  a = A003557(i)
  p [i, a, A(a, i, n)] if a > 1
}
