require 'prime'

# 0 <= a <= p
def f(a, p)
  return 0 if a % p == 0
  flag = false
  (1..p - 1).each{|i|
    flag = true if (i * i) % p == a
  }
  return 1 if flag
  -1
end

def h(p)
  -(1..p - 1).inject(0){|s, i| s + f(i, p) * i} / p
end

def A002143(n)
  ary = [1]
  Prime.each(10 ** 7){|i|
    break if ary.size == n
    ary << h(i) if i > 3 && i % 4 == 3
  }
  ary
end
ary = A002143(88)

# OEIS A002143のデータ
ary0 =
[1,1,1,1,3,3,1,5,3,1,7,5,3,5,3,5,5,3,7,1,11,5,13,
 9,3,7,5,15,7,13,11,3,3,19,3,5,19,9,3,17,9,21,15,5,
 7,7,25,7,9,3,21,5,3,9,5,7,25,13,5,13,3,23,11,5,5,
 31,13,5,21,15,5,7,9,7,33,7,21,3,29,3,31,19,5,11,
 15,27,17,13]
# 一致の確認
p ary == ary0

