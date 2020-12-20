def is_Golomb_ruler(ary)
  n = ary.size
  a = []
  (0..n - 2).each{|i|
    (i + 1..n - 1).each{|j|
      k = ary[j] - ary[i]
      if a.include?(k)
        return false
      else
        a << k
      end
    }
  }
  true
end

# 対称型を含む
def A(deg, l)
  a = []
  (1..l).to_a.combination(deg - 1){|c|
    ary = [0] + c
    a << ary if is_Golomb_ruler(ary)
  }
  a
end

# 対称型を省く
def B(deg, l)
  a = []
  A(deg, l).each{|ary|
    if !a.include?(ary.map{|i| ary[-1] - i}.reverse)
      a << ary
      p ary
    end
  }
end

B(2,  1)
B(3,  3)
B(4,  6)
B(5, 11)
B(6, 17)
B(7, 25)
