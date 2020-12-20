# 和因子はmin以上max以下
def partition(n, min, max)
  return [[]] if n == 0
  [max, n].min.downto(min).flat_map{|i| partition(n - i, min, i).map{|rest| [i, *rest]}}
end

def A051908(n)
  # 1 = 1, 1 = 1 / 1の一通り
  ary = [1]
  (2..n).each{|m|
    cnt = 0
    partition(m, 2, m).each{|ary|
      cnt += 1 if ary.inject(0){|s, i| s + 1 / i.to_r} == 1
    }
    ary << cnt
  }
  ary
end
ary = A051908(88)

# OEIS A051908のデータ
ary0 =
[1,0,0,1,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,1,0,3,0,1,
 1,1,1,2,3,2,2,1,2,2,2,4,5,5,2,4,5,5,9,4,4,6,4,4,7,
 8,4,10,9,9,11,8,13,13,15,16,21,18,16,22,19,18,30,
 24,19,26,28,26,29,35,29,44,28,47,48,43,44,59,49,
 51,72,65,64,79]
# 一致の確認
p ary == ary0