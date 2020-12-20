require 'prime'

n = 2 ** 12
@ary = [1]
s = 1
s_ary = [['□'], ['□']]
(1..n).each{|i|
  j = @ary[i / 2]
  j *= (-1) ** (i / 2) if i % 2 > 0
  @ary << j
  s += j
  str = '□'
  str = '■' if i.prime?
  if s_ary[s] == nil
    s_ary[s] = [str]
  else
    s_ary[s] << str
  end
}
(1..s_ary[1..-1].size - 1).each{|i| p s_ary[i].join}

