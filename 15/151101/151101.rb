def f(r)
  q = r * r
  m = (Math.sqrt(2) * r / 2).to_i
  # 正方形の内部またはx軸,y軸上の格子点
  s = (2 * m + 1) * (2 * m + 1) + (r - m) * 4
  # 上記以外
  (m + 1..r).each{|x| s += 8 * Math.sqrt(q - x * x).to_i}
  s
end

def A000328(n)
  (0..n).map{|i| f(i)}
end
ary = A000328(46)

# OEIS A000328のデータ
ary0 =
[1,5,13,29,49,81,113,149,197,253,317,377,441,529,
 613,709,797,901,1009,1129,1257,1373,1517,1653,
 1793,1961,2121,2289,2453,2629,2821,3001,3209,3409,
 3625,3853,4053,4293,4513,4777,5025,5261,5525,5789,
 6077,6361,6625]
# 一致の確認
p ary == ary0

