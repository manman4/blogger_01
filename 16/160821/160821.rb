def A(m, n)
  a = Array.new(m, 1)
  ary = [1]
  while ary.size < n
    i = a[1..-1].inject(0){|s, i| s += i * i}
    break if i % a[0] > 0
    a = *a[1..-1], i / a[0]
    ary << a[0]
  end
  ary
end

n = 10
(2..20).each{|i| p A(i, n + i)}

