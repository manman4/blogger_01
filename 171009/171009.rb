# 和因子はmin以上max以下
def partition(n, min, max)
  return [[]] if n == 0
  [max, n].min.downto(min).flat_map{|i| partition(n - i, min, i).map{|rest| [i, *rest]}}
end

def PD(n)
  partition(n, 1, n).map{|i| i.each_with_object(Hash.new(0)){|v, o| o[v] += 1}.values.inject(:*)}.inject(:+)
end

def PD_t(n)
  partition(n, 1, n).map{|i| i.each_with_object(Hash.new(0)){|v, o| o[v] += 1}.values}.map{|i| i.size * i.inject(:*)}.inject(:+)
end

def PDO(n)
  partition(n, 1, n).select{|i| i.all?{|j| j.odd?}}.map{|a| a.each_with_object(Hash.new(0)){|v, o| o[v] += 1}.values.inject(:*)}.inject(:+)
end

def PDO_t(n)
  partition(n, 1, n).select{|i| i.all?{|j| j.odd?}}.map{|a| a.each_with_object(Hash.new(0)){|v, o| o[v] += 1}.values}.map{|i| i.size * i.inject(:*)}.inject(:+)
end

n = 40
p (1..n).map{|i| PD(i)}
p (1..n).map{|i| PD_t(i)}
p (1..n).map{|i| PDO(i)}
p (1..n).map{|i| PDO_t(i)}

