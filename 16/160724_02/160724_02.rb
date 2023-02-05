require 'OpenSSL'

def pow(a, m, mod)
  return 1 % mod if m == 0
  k = pow(a, m >> 1, mod)
  k *= k
  return k % mod if m & 1 == 0
  return k * a % mod
end

a = 10123457689
b = 1023456987896543201

n = a * b
# (a - 1) * (b - 1)と互い素なeを見つける
l = (a - 1).lcm(b - 1)
e = 2
while e.gcd(l) != 1
  e += 1
end

# 公開鍵
p [e, n]
# 秘密鍵
p [d = OpenSSL::BN.new("#{e}").mod_inverse(l).to_i, n]

p numbers = [20160724, 20160725, 20160726]
# 公開鍵を使って暗号化
p encrypted_numbers = numbers.map{|i| pow(i, e, n)}
# 復号化
p encrypted_numbers.map{|i| pow(i, d, n)}
