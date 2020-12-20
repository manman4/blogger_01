# 和因子はmin以上max以下で互いに異なる
def partition(n, min, max)
  return [[]] if n == 0
  [max, n].min.downto(min).flat_map{|i| partition(n - i, min, i - 1).map{|rest| [i, *rest]}}
end

(2..130).each{|n|
  p [n, partition(n, 2, n).select{|ary| ary.inject(0){|s, i| s + 1 / i.to_r} == 1}]
}
