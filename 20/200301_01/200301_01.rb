require 'numo/pocketfft'
include Numo

def A(k, n)
  ary = []
  x = Int32[1]
  a = Int32[*[1] * k]
  (n + 1).times{
    ary << x.to_a
    # Numo::PocketfftはDFloat
    x = Int32.cast(Numo::Pocketfft.fftconvolve(x, a).map{|i| i.round})
  }
  ary.flatten
end

def B(k, n)
  ary = []
  x = Int64[1]
  a = Int64[1..k]
  (n + 1).times{
    ary << x.to_a
    # Numo::PocketfftはDFloat
    x = Int64.cast(Numo::Pocketfft.fftconvolve(x, a).map{|i| i.round})
  }
  ary.flatten
end

def A329708(n)
  ary = []
  (0..n).each{|i|
    a = Int32[1..i + 1]
    # Numo::PocketfftはDFloat
    ary << Int32.cast(Numo::Pocketfft.fftconvolve(a, a).map{|i| i.round}).to_a
  }
  ary.flatten
end

(1..5).each{|i| p A(i, 10)}
(1..5).each{|i| p B(i, 10)}
p A329708(10)

