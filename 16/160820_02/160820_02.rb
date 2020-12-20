n = 15000
i = 0
a, b = 0, 6
c, d = 1, 5
while i < n
  i += 1
  a, b = b, ((((34 * i + 51) * i + 27) * i + 5) * b - i ** 3 * a) / (i + 1r) ** 3
  c, d = d, ((((34 * i + 51) * i + 27) * i + 5) * d - i ** 3 * c) / (i + 1) ** 3
  p i if a.numerator.gcd(c) > 1
end

