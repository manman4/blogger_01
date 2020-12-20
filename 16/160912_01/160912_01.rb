require 'prime'

s = 0
ary = []
Prime.each(10 ** 8){|i|
  s += i
  ary << s if Math.sqrt(s).to_i ** 2 == s
}
p ary

