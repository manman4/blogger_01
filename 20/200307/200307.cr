def a(k, m, n)
  return 1 if n == 0
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
  a.size
end

def b(k, m, n)
  return 1 if n == 0
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
  a.size
end

(0..13).each{|i|
  (0..i + 2).each{|j|
    p a = (1..16).map{|k| a(i, j, k)}
    p b = (0..15).map{|k| b(i, j, k)}
    p [i, j, a == b]
  }
}
