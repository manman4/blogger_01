require 'prime'

s = 0
ary = []
Prime.each(10 ** 4){|i|
  s += i
  ary << s if s.prime?
}
p ary

