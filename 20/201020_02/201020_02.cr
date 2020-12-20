def a006950(n)
  return 1 if n < 3
  a = (1..n - 1).map{|i| [i]}
  ary = [[n]]
  while a.size != 0
    b = Array(Array(Int32)).new
    a.each{|i|
      x = i[-1].to_i
      s = n - i.sum
      t = x % 2
      (x + t..s - 1).each{|j| b << i.clone + [j]}
      ary << i.clone + [s] if s >= x + t
    }
    a = b
  end
  ary.size
end

p (0..90).map{|i| a006950(i)}
