require 'ecdsa'

def show_key(key)
  p key
  p [key.x, key.y]
end

group = ECDSA::Group::Secp256k1
G = group.generator
N = group.order
p "N = #{N}"

# N*G
p G.multiply_by_scalar(N)

show_key(G.multiply_by_scalar(2017101920171019))

(1..50).each{|i|
  p i
  show_key(G.multiply_by_scalar(i))
}
