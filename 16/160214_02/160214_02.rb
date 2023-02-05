require 'prime'

# nはprで何回割り切れるか？
def f(pr, n)
  i = 0
  while n % pr == 0
    n /= pr
    i += 1
  end
  i
end

# 3より大きな素数
ary = Prime.each(50).select{|i| i > 3}

ary.each{|pr|
  (0..10).each{|t|
    # 分子の計算
    n = (t * pr + 1..t * pr + pr - 1).inject(0){|s, i| s + 1.to_r / i}.numerator
    # 定理の確認
    p [pr, t, n, f(pr, 2 * t + 1) + 2 == f(pr, n)]
  }
}
