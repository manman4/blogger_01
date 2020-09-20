def f(a, b, c, n)
  ary = [a]
  while ary.size < n + 1
    a, b, c = b, c, 82 * c + 82 * b - a
    ary << a
  end
  ary
end

def A272853(n)
  f(9, 791, 65601, n)
end

def A272854(n)
  f(10, 812, 67402, n)
end

def A272855(n)
  f(12, 1010, 83802, n)
end

def A051028(n)
  f(1, 135, 11161, n)
end

def A051029(n)
  f(2, 138, 11468, n)
end

def A051030(n)
  f(2, 172, 14258, n)
end

n = 30
a_ary = A272853(n)
b_ary = A272854(n)
c_ary = A272855(n)
(0..n).each{|i|
  a, b, c = a_ary[i], b_ary[i], c_ary[i]
  p [a, b, c, a * a * a + b * b * b == c * c * c + (-1) ** i]
}

a_ary = A051028(n)
b_ary = A051029(n)
c_ary = A051030(n)
(0..n).each{|i|
  a, b, c = a_ary[i], b_ary[i], c_ary[i]
  p [a, b, c, a * a * a + b * b * b == c * c * c + (-1) ** i]
}

