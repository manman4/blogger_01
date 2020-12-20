ary = []
(1..9).to_a.permutation{|a|
  i = a[0] * 100 + a[1] * 10 + a[2]
  j = a[3] * 10 + a[4]
  k = a[5] * 10 + a[6]
  l = a[7] * 10 + a[8]
  ary << i * j if i * j == k * l
}
p ary.uniq.sort

