def a(k, m, n)
  a = (m..m + n - 1).map{|i| [i]}
  len = 1
  while len < n
    b = Array(Array(Int32)).new
    a.each{|c|
      (m..m + n - 1).each{|num|
        if !c.includes?(num)
          i = c.clone + [num]
          if (i[-2] * (len + k + 1)) > (i[-1] * (len + k))
            b << i
          end
        end
      }
    }
    a = b
    len += 1
  end
  ary = Array.new(n, 0)
  a.each{|c| ary[c[0] - m] += 1}
  ary[1..-1]
end

def b(k, m, n)
  a = (m..m + n - 1).map{|i| [i]}
  len = 1
  while len < n
    b = Array(Array(Int32)).new
    a.each{|c|
      (m..m + n - 1).each{|num|
        if !c.includes?(num)
          i = c.clone + [num]
          if (i[-2] * (len + k + 1)) >= (i[-1] * (len + k))
            b << i
          end
        end
      }
    }
    a = b
    len += 1
  end
  ary = Array.new(n, 0)
  a.each{|c| ary[c[0] - m] += 1}
  ary
end

(0..13).each{|i|
  (0..i + 1).each{|j|
    p a = (1..16).map{|k| a(i, j, k)}
    p b = (0..15).map{|k| b(i, j, k)}
    p [i, j, a == b]
  }
}
