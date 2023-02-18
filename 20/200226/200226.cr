alias Ary = Int32 | String | Array(Ary)

a = Array(Ary).new
5.times{|i|
  a << i
  a << i.to_s
  p a
  b = Array(Ary).new
  b << a
  a = b
}

