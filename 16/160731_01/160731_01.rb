require 'prime'

def number_of_divisors(n)
  n.prime_division.inject(1){|s, a| s *= a[1] + 1}
end

def A002182(n)
  i = 1
  ary = [i]
  max = 1
  while ary.size < n
    i += 1
    j = number_of_divisors(i)
    if j > max
      ary << i
      max = j
    end
  end
  ary
end
ary = A002182(41)

# OEIS A002182のデータ
ary0 =
[1,2,4,6,12,24,36,48,60,120,180,240,360,720,840,
 1260,1680,2520,5040,7560,10080,15120,20160,25200,
 27720,45360,50400,55440,83160,110880,166320,
 221760,277200,332640,498960,554400,665280,720720,
 1081080,1441440,2162160]
# 一致の確認
p ary == ary0

