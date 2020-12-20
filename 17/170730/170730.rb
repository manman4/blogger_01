def A(n)
  (n..n * 10 - 1).select{|i| (i ** 5 - i) % (n * 10) == 0}
end

(0..7).each{|i| p [i, A(10 ** i)]}

