# 和因子はmin以上max以下で互いに異なる
def partition(n, min, max)
  return [[]] if n == 0
  [max, n].min.downto(min).flat_map{|i| partition(n - i, min, i - 1).map{|rest| [i, *rest]}}
end

def A000009(n)
  (0..n).map{|i| partition(i, 1, i).size}
end

def A051907(n)
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

ary = A000009(55)
# OEIS A000009のデータ
ary0 =
[1,1,1,2,2,3,4,5,6,8,10,12,15,18,22,27,32,38,46,
 54,64,76,89,104,122,142,165,192,222,256,296,340,
 390,448,512,585,668,760,864,982,1113,1260,1426,
 1610,1816,2048,2304,2590,2910,3264,3658,4097,4582,
 5120,5718,6378]
# 一致の確認
p ary == ary0

ary = A051907(101)
# OEIS A051907のデータ
ary0 =
[1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,
 0,0,0,0,0,1,1,1,0,0,0,0,1,1,0,0,0,0,1,0,2,0,0,0,0,
 2,0,1,1,1,1,0,2,0,1,1,1,2,0,4,1,3,4,0,2,0,6,0,1,2,
 1,3,0,4,2,1,5,5,3,2,3,3,5,5,5,2,1,12,5,4,11,4,5,2,
 11,3,5]
# 一致の確認
p ary == ary0

