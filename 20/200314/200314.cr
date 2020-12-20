require "big"

def pow(a, m, mod)
  return 1.to_big_i if m == 0
  k = pow(a, m >> 1, mod)
  k *= k
  return k % mod if m & 1 == 0
  return k * a % mod
end

n = 546688785009341741
p pow(19, n, n)
