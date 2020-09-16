1.step(50, 4){|i|
  (0..19).each{|j|
    str = (j ** i).to_s
    p [i, str[0..-2] + ' ' + str[-1]]
  }
  p ''
}
