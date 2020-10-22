def a332800(n)
  return 1 if n == 0
  a = (1..n).map{|i| [i]}
  len = 1
  while len < n
    b = Array(Array(Int32)).new
    a.each{|c|
      (1..n).each{|num|
        if !c.includes?(num)
          i = c.clone + [num]
          if len > 1
            if (i[-3] % i[-2]) <= (i[-2] % i[-1])
              b << i
            end
          else
            b << i
          end
        end
      }
    }
    a = b
    len += 1
  end
  a.size
end

(0..20).each{|i| p a332800(i)}
