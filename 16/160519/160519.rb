def a(n)
  return 1 if n <= 1
  (1..n).inject(:*)
end

def c(n, r)
  r = n - r if r > n - r
  return 0 if r < 0
  return 1 if r == 0
  return (n - r + 1..n).inject(:*) / (1..r).inject(:*)
end

def f(n)
  (0..n).inject(0){|s, i| s += (-1) ** i * a(n - i) * c(2 * n - i, i) * 2 * n / (2 * n - i)}
end

def A000179(n)
  ary = [1, 0]
  return ary[0..n] if n <= 1
  ary + (2..n).map{|i| f(i)}
end
ary = A000179(25)

# OEIS A000179のデータ
ary0 =
[1,0,0,1,2,13,80,579,4738,43387,439792,4890741,
 59216642,775596313,10927434464,164806435783,
 2649391469058,45226435601207,817056406224416,
 15574618910994665,312400218671253762,
 6577618644576902053,145051250421230224304,
 3343382818203784146955,80399425364623070680706,
 2013619745874493923699123]
# 一致の確認
p ary == ary0
