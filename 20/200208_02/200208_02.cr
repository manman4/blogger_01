require "big"

def a006880(n)
  max = 10 ** n - 1
  ary = Array.new(max + 1, true)

  i = 2
  while i * i <= max
    if ary[i]
      (2 * i).step(to: max, by: i){|j| ary[j] = false}
    end
    i += 1
  end

  s = 0.to_big_i
  (2..max).each{|i| s += 1 if ary[i]}
  p s
end

def a046731(n)
  max = 10 ** n - 1
  ary = Array.new(max + 1, true)

  i = 2
  while i * i <= max
    if ary[i]
      (2 * i).step(to: max, by: i){|j| ary[j] = false}
    end
    i += 1
  end

  s = 0.to_big_i
  (2..max).each{|i| s += i if ary[i]}
  p s
end

n = 8
p (0..n).map{|i| a006880(i)}
p (0..n).map{|i| a046731(i)}
