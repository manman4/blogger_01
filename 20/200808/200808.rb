# A307883とA307884
def A(k, n)
  i, a, b = 0, 1, k + 1
  ary = [1]
  while i < n
    i += 1
    a, b = b, ((k + 1) * (2 * i + 1) * b - (k - 1) ** 2 * i * a) / (i + 1)
    ary << a
  end
  ary
end

# A243631とA336727
def B(k, n)
  i, a, b = 0, 1, 1
  ary = [1]
  while i < n
    i += 1
    a, b = b, ((k + 1) * (2 * i + 1) * b - (k - 1) ** 2 * (i - 1) * a) / (i + 2)
    ary << a
  end
  ary
end

n = 10
-10.upto(10){|i| p [i, A(i, n)]}
-10.upto(10){|i| p [i, B(i, n)]}