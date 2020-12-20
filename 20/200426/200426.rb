# n=1のとき(x,y)=(z,w)=(6,-3)
def A(n)
  x, y = 6 * n * n - 4 * n + 4, -3 * n * n - 5 * n + 5
  z, w = 4 * n * n - 4 * n + 6,  5 * n * n - 5 * n - 3
  puts "#{x}^3 + (#{y})^3 = #{x ** 3 + y ** 3}"
  puts "#{z}^3 +   #{w}^3  = #{z ** 3 + w ** 3}"
end

def B(n)
  63 * (3 * n * n - 3 * n + 1) * (n * n + n + 1) * (n * n - 3 * n + 3)
end

n = 100
(2..n).each{|i| A(i)}
p (1..n).map{|i| B(i)}
