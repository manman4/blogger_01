def f(num, k, n)
  l = (10 ** n - 1) / 3
  m0 = (10 ** n - 1) * num / 3
  m1 = (0..k - 1).inject(0){|s, i| s + 10 ** (i * n) * (m0 + k - i)}
  "#{l * m1} = #{l} * #{m1}"
end

(1..2).each{|num| (1..3).each{|k| (1..10).each{|n| puts f(num, k, n)}}}