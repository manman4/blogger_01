def A(m, n)
  a = Array.new(4, 1)
  ary = [1]
  while ary.size < n + 1
    i = a[1] * a[3] + a[2] ** m
    break if i % a[0] > 0
    a = *a[1..-1], i / a[0]
    ary << a[0]
  end
  ary
end

n = 15
(0..7).each{|i| p [i, A(i, n)]}

