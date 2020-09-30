(2..18).each{|n|
  a_ary = []
  (1..n).to_a.repeated_combination(n){|c|
    a_ary << c if (c.inject(:+) ** 4) * 2 == c.map{|i| i ** 5}.inject(:+) + c.map{|i| i ** 7}.inject(:+)
  }
  p a_ary
}

