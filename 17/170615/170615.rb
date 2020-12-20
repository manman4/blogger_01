require 'prime'

def f(m, n)
  (0..m - 1).each{|i|
    return i if (i * n - 1) % m == 0
  }
end

n = 50
Prime.each(n){|pr|
  q = pr * pr
  a = []
  (1..pr - 1).each{|i|
    a << f(q, i)
  }
  j = a.inject(:+)
  p [a, j, j % q]
}

Prime.each(n){|pr|
  a = []
  (1..pr - 1).each{|i|
    a << f(pr, i * i)
  }
  j = a.inject(:+)
  p [a, j, j % pr]
}
