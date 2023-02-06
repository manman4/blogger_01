N = 11
D2 = 3

def check2(d, a, i)
  return true if i < d
  !((a[i] - a[i - d]).abs == d)
end

def solve2(d, len, a = [])
  b = []
  if a.size == len
    b << a
  else
    (1..len).each{|m|
      s = a.size
      if s == 0 || (s > 0 && !a.include?(m))
        if check2(d, a + [m], s)
          b += solve2(d, len, a + [m])
        end
      end
    }
  end
  b
end

(1..D2).each{|d2|
  (1..N).each{|b|
    p [d2, b, solve2(d2, b).size]
  }
}