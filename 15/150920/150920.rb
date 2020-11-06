# 階乗
def f(ary)
  ary.map{|i| (1..i).inject(:*)}.inject(:*)
end

# nの分割を列挙
def partion_ary(n)
  ary = [[n]]
  # nの分割になっていないものは以下の操作を繰り返す
  f_ary = []
  (n - 1).downto(1){|i| f_ary.push([i])}
  while f_ary.size > 0
    b_ary = []
    f_ary.each{|c|
      i = [n - c.inject(:+), c[-1]].min
      (1..i).each{|j|
        d = c.clone
        d.push(j)
        # nの分割になったら、aryに加える
        d.inject(:+) == n ? ary.push(d) : b_ary.push(d)
      }
    }
    f_ary = b_ary
  end
  ary
end

def multinomials_and_partitions(n)
  m = (1..n).inject(:*)
  ary = []
  partion_ary(n).each{|a|
    ary << m / (f(a) * f(a.group_by(&:to_i).map{|i| i.last.size)))
  }
  ary
end

(1..15).each{|i| p multinomials_and_partitions(i)}
