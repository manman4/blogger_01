def A(l, m, n)
  a = Array.new(m, 1)
  ary = [1]
  while ary.size < n
    i = a[1..-1].inject(0){|s, i| s += i * i} + l
    break if i % a[0] > 0
    a = *a[1..-1], i / a[0]
    ary << a[0]
  end
  ary
end

def f(l, m, n)
  a = Array.new(m, 1)
  ary = [1]
  while ary.size < n
    a = *a[1..-1], (l + m) * a[1..-1].inject(:*) - a[0]
    ary << a[0]
  end
  ary
end

n = 15
(2..5).each{|m|
  (0..3).each{|l|
    p [m, l]
    p ary = A(l, m, n)
    p ary == f(l, m, n)
  }
}
