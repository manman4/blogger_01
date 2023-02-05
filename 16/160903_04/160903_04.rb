def b(m, n)
  b = Array.new(m, 1)
  ary = [1]
  while ary.size < n + 1
    i = b[1..-1].inject(:*) + 1
    break if i % b[0] > 0
    b = *b[1..-1], i / b[0]
    ary << b[0]
  end
  ary
end

def A0(m, n)
  b = b(m, n + m - 2)
  (0..n).map{|i| b[i..i + m - 2].inject(:*)}
end

def A1(a, n)
  ary = [1]
  while ary.size < n + 1
    i = a[1..-1].inject(1){|s, i| s * (i + 1)}
    break if i % a[0] > 0
    a = *a[1..-1], i / a[0]
    ary << a[0]
  end
  ary
end

n = 13
# A007018
a =
[1,2,6,42,1806,3263442,10650056950806,
 113423713055421844361000442,
 12864938683278671740537145998360961546653259485195806]
a = [1] + a
(2..a.size).each{|i|
  p b(i, n)
  p ary = A0(i, n)
  p ary == A1(a[0..i - 1], n)
}
