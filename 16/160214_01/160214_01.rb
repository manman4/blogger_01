def A001008(n)
  ary = []
  s = 0
  (1..n).each{|i|
    s += 1.to_r / i
    ary << s.numerator
  }
  ary
end

def A002805(n)
  ary = []
  s = 0
  (1..n).each{|i|
    s += 1.to_r / i
    ary << s.denominator
  }
  ary
end

ary = A001008(29)
# OEIS A001008のデータ
ary0 =
[1,3,11,25,137,49,363,761,7129,7381,83711,86021,
 1145993,1171733,1195757,2436559,42142223,14274301,
 275295799,55835135,18858053,19093197,444316699,
 1347822955,34052522467,34395742267,312536252003,
 315404588903,9227046511387]
# 一致の確認
p ary == ary0

ary = A002805(29)
# OEIS A002805のデータ
ary0 =
[1,2,6,12,60,20,140,280,2520,2520,27720,27720,
 360360,360360,360360,720720,12252240,4084080,
 77597520,15519504,5173168,5173168,118982864,
 356948592,8923714800,8923714800,80313433200,
 80313433200,2329089562800]
# 一致の確認
p ary == ary0
