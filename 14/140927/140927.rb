# Nは3以上
N = 303
ary = (1..(N / 2.0).ceil).map{|i| i * 2 - 1}

m = 1
n = ary[m]
while 2 * n <= N   # 次に取り除く数がNを超えなくなるまで続ける。
  ary0 = []
  ary.each_with_index{|e, i|
    if e <=  n
      ary0 << e
    elsif
      if (i + 1) % n != 0
        ary0 << e
      end
    end
  }
  ary = ary0
  m += 1
  n = ary[m]
end

# OEIS A000959のデータ
ary0 =
[1,3,7,9,13,15,21,25,31,33,37,43,49,51,63,67,69,
 73,75,79,87,93,99,105,111,115,127,129,133,135,141,
 151,159,163,169,171,189,193,195,201,205,211,219,
 223,231,235,237,241,259,261,267,273,283,285,289,
 297,303]
# 一致の確認
p ary == ary0

