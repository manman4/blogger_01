def pow(a, m, mod)
  return 1 % mod if m == 0
  k = pow(a, m >> 1, mod)
  k *= k
  return k % mod if m & 1 == 0
  return k * a % mod
end

[38832409867, 492385451091805616444].each{|i| p [i, pow(3, i, i) - i]}

