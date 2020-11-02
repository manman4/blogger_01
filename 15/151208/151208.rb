# 和因子はmin以上max以下
def partition(n, min, max)
  return [[]] if n == 0
  [max, n].min.downto(min).flat_map{|i| partition(n - i, min, i).map{|rest| [i, *rest]}}
end

(2..77).each{|n|
  # nの分割で逆数和が1
  p [n, partition(n, 2, n).select{|ary| ary.inject(0){|s, i| s + 1 / i.to_r} == 1}]
}