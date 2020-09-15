def A(q, n)
  ary = [1]
  (1..n).each{|i| ary << (0..i - 1).inject(0){|s, j| s + q ** j * ary[j] * ary[i - 1 - j]}}
  ary
end

m = 15
n = 10
(-m).upto(m){|i| p [i, A(i, n)]}

