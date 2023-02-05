def f(ary)
  f_ary = Array(Int32).new
  while !(ary.all?{|i| i == 0})
    a = Array(Int32).new
    s = 0
    ary.each{|i|
      if i == 1
        a << 0
        s += 1
      elsif i > 0
        a << i - 2
        s += 2
      end
    }
    ary = a
    f_ary << s
  end
  f_ary
end

def a316384(n)
  return 1 if n < 3
  a = (1..n - 1).map{|i| [i]}
  ary = Array(Array(Int32)).new
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
  ary.select{|i| i.reverse == f(i)}.size
end

p (0..90).map{|i| a316384(i)}

