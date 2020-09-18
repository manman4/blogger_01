def ncr(n, r)
  return 1 if r == 0
  (n - r + 1..n).inject(:*) / (1..r).inject(:*)
end

n = 20
# A000984, A002893
(1..10).each{|m|
  p [m, (0..n).map{|i| (0..i).inject(0){|s, j| s + ncr(i, j) ** 2 * ncr(m * j, j)}}]
}
# A000984, A001850, A069835, A084771, A084772, A098659
(1..10).each{|m|
  p [m, (0..n).map{|i| (0..i).inject(0){|s, j| s + ncr(i, j) ** 2 * m ** j}}]
}
