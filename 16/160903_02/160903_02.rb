def b(n)
  b = [1 / 2r, 4, 1 / 2r, 1 / 2r]
  ary = [1 / 2r]
  while ary.size < n + 1
    i = (b[1..-1].inject(:*) + 1) / b[0]
    i = i.to_i if i.denominator == 1
    b = *b[1..-1], i
    ary << b[0]
  end
  ary
end

def A276175(n)
  b = b(n + 2)
  (0..n).map{|i| b[i..i + 2].inject(:*).to_i}
end

n = 16
p b(n)
p A276175(n)
