require 'prime'

# Nは3以上
N = 1123
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

l_prime = []
ary.each{|i|
  l_prime << i if i.prime?
}

# OEIS A031157のデータ
l_prime0 =
[3,7,13,31,37,43,67,73,79,127,151,163,193,211,223,
 241,283,307,331,349,367,409,421,433,463,487,541,
 577,601,613,619,631,643,673,727,739,769,787,823,
 883,937,991,997,1009,1021,1039,1087,1093,1117,
 1123]
# 一致の確認
p l_prime == l_prime0

