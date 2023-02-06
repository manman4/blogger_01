N = 11
D1 = 4

def check1(d, a, i)
  return true if i == 0
  j = 1
  d_max = [i, d - 1].min
  while (a[i] - a[i - j]).abs >= d && j < d_max
    j += 1
  end
  (a[i] - a[i - j]).abs >= d
end

def solve1(d, len, a = [])
  b = []
  if a.size == len
    b << a
  else
    (1..len).each{|m|
      s = a.size
      if s == 0 || (s > 0 && !a.include?(m))
        if check1(d, a + [m], s)
          b += solve1(d, len, a + [m])
        end
      end
    }
  end
  b
end

(2..D1).each{|d1|
  (d1..N).each{|b|
    p [d1, b, solve1(d1, b).size]
  }
}