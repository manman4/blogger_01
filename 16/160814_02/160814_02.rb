n = 5000
(1..n).each{|i|
  (i - 1).downto(1){|j|
    k = i ** 3 - j ** 3 + 1
    l = (k ** (1.0 / 3)).round
    break if l > j
    p [l, j, i, l ** 3 + j ** 3 == i ** 3 + 1] if l ** 3 == k
  }
}
p ''
(1..n).each{|i|
  (i - 1).downto(1){|j|
    k = i ** 3 - j ** 3 - 1
    l = (k ** (1.0 / 3)).round
    break if l > j
    p [l, j, i, l ** 3 + j ** 3 == i ** 3 - 1] if l ** 3 == k
  }
}

