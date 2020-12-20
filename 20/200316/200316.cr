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
  a
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
  # bijection
  a.map{|c| c.map{|i| i + 1} + [m]}
end

# 具体例も出力
(0..5).each{|i|
  (0..i + 1).each{|j|
    p a = (2..5).map{|k| a(i, j, k)}
    p b = (1..4).map{|k| b(i, j, k)}
    p [i, j, a == b]
  }
}

(0..13).each{|i|
  (0..i + 1).each{|j|
    a = (2..16).map{|k| a(i, j, k)}
    b = (1..15).map{|k| b(i, j, k)}
    p [i, j, a == b]
  }
}
