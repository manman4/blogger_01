def show(ary, k, n)
  ary.each{|i| puts "#{i} * #{k} = #{i * k}"}
end

n = 20
ary = (0..n).map{|i| ((9 * i + 8) * 10 ** i - 8) / 81}
show(ary, 8, n)
show(ary, 9, n)
ary = (0..n).map{|i| ((-9 * i + 82) * 10 ** i - 1) / 81}
show(ary, 8, n)
show(ary, 9, n)
