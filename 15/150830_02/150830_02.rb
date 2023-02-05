@ary = ('A'..'Z').to_a

# y = a * x + b
def affine(a, b, str)
  h = {}
  (0..25).each{|i| h[@ary[i]] = @ary[(a * i + b) % 26]}
  (0..str.size - 1).each{|i| str[i] = h[str[i]]}
  str
end

def decode(a, b, str)
  g = {}
  (0..25).each{|i| g[@ary[(a * i + b) % 26]] = @ary[i]}
  (0..str.size - 1).each{|i| str[i] = g[str[i]]}
  str
end

(0..11).each{|i|
  p affine(7 ** i, 0, @ary.join)
}
