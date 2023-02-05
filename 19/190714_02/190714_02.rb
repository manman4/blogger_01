require 'ecdsa'

def show_key(key)
  p key
  p [key.x, key.y]
end

def Ecdsa(group)
  g = group.generator
  n = group.order
  p "n = #{n}"

  # n*g
  p g.multiply_by_scalar(n)

  (1..10).each{|i|
    p i
    show_key(g.multiply_by_scalar(i))
  }
end

Ecdsa(ECDSA::Group::Nistp192)
Ecdsa(ECDSA::Group::Nistp224)
Ecdsa(ECDSA::Group::Nistp256)
Ecdsa(ECDSA::Group::Nistp384)
Ecdsa(ECDSA::Group::Nistp521)

Ecdsa(ECDSA::Group::Secp112r1)
Ecdsa(ECDSA::Group::Secp112r2)
Ecdsa(ECDSA::Group::Secp128r1)
Ecdsa(ECDSA::Group::Secp128r2)
Ecdsa(ECDSA::Group::Secp160k1)
Ecdsa(ECDSA::Group::Secp160r1)
Ecdsa(ECDSA::Group::Secp160r2)
Ecdsa(ECDSA::Group::Secp192k1)
Ecdsa(ECDSA::Group::Secp192r1)
Ecdsa(ECDSA::Group::Secp224k1)
Ecdsa(ECDSA::Group::Secp224r1)
Ecdsa(ECDSA::Group::Secp256k1)
Ecdsa(ECDSA::Group::Secp256r1)
Ecdsa(ECDSA::Group::Secp384r1)
Ecdsa(ECDSA::Group::Secp521r1)
