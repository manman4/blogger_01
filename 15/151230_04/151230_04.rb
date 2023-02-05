require 'prime'

def A056768(n)
  ary = Prime.each.take(n)
  m = ary[-1]
  ps = Array.new(m + 1){0}
  ps[0] = 1
  a_ary = []
  ary.each{|num|
    (num..m).each{|i|
      ps[i] += ps[i - num]
    }
    a_ary << ps[num]
  }
  a_ary
end

p A056768(10 ** 3)

