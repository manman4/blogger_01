def mul(f_ary, b_ary)
  s1, s2 = f_ary.size, b_ary.size
  ary = Array.new(s1 + s2 - 1, 0)
  (0..s1 - 1).each{|i|
    (0..s2 - 1).each{|j|
      ary[i + j] += f_ary[i] * b_ary[j]
    }
  }
  ary
end

def power(ary, n)
  return [1] if n == 0
  k = power(ary, n >> 1)
  k = mul(k, k)
  return k if n & 1 == 0
  return mul(k, ary)
end

def ncr(n, r)
  return 1 if r == 0
  (n - r + 1..n).inject(:*) / (1..r).inject(:*)
end

def f(n)
  return 1 if n < 2
  (1..n).inject(:*)
end

def A(n)
  ary = power([0] + (1..n).map{|i| (-1) ** (n - i) * ncr(n - 1, n - i) / f(i).to_r}, n)
  (0..ary.size - 1).inject(0){|s, i| s + f(i) * ary[i]}.to_i
end

n = 20
(0..n).each{|i| p [i, A(i)]}

