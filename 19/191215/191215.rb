require 'prime'

def A124223(p)
  a = [0, 1]
  (2..p - 1).each{|i| a << (-a[p % i] * (p / i)) % p}
  a[1..-1]
end

p Prime.each(200).map{|i| A124223(i)}.flatten

