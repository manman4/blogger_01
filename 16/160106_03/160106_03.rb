# 和因子はmin以上max以下で互いに異なる
def partition(n, min, max)
  return [[]] if n == 0
  [max, n].min.downto(min).flat_map{|i| partition(n - i, min, i - 1).map{|rest| [i, *rest]}}
end

(2..135).each{|n|
  p_ary = []
  partition(n, 2, n).each{|ary|
    a = ary.inject(0){|s, i| s + 1 / i.to_r}
    p_ary << [a.numerator, ary] if a.denominator == 1
  }
  p [n, p_ary]
}

