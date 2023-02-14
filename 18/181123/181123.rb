def partition(n, min, max)
  return [[]] if n == 0
  [max, n].min.downto(min).flat_map{|i| partition(n - i, min, i).map{|rest| [i, *rest]}}
end

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

def ncr(n, r)
  return 1 if r == 0
  (n - r + 1..n).inject(:*) / (1..r).inject(:*)
end

def f(n)
  return 1 if n < 2
  (1..n).inject(:*)
end

def A(a)
  ary = [1]
  a.each{|i|
    ary = mul(ary, [0] + (1..i).map{|j| (-1) ** (i - j) * ncr(i - 1, i - j) / f(j).to_r})
  }
  (0..ary.size - 1).inject(0){|s, i| s + f(i) * ary[i]}.to_i
end

def B(n)
  a = Array.new(n + 1, 0)
  partition(n, 1, n).each{|ary|
    a[ary.size] += A(ary) / ary.group_by(&:to_i).inject(1){|s, i| s * f(i.last.size)}
  }
  a[1..-1]
end

n = 40
(1..n).each{|i| p B(i)}
# Row sums
p (1..n).map{|i| B(i).inject(:+)}
