def A(digit)
  ary = []
  (10 ** (digit - 1)..10 ** digit - 1).each{|i|
    flag = true
    (1..10 - digit).each{|j|
      a = (j..j + digit - 1).to_a
      k = a.join.to_i
      l = i + k
      if l.to_s.split('').map(&:to_i).sort != a
        flag = false
        break
      end
    }
    ary << i if flag
  }
  ary
end

def B(ary, digit)
  p ary
  puts
  ary.each{|i|
    (1..10 - digit).each{|j|
      k = (j..j + digit - 1).to_a.join.to_i
      puts "#{i} + #{k} = #{i + k}"
    }
    puts "-" * (digit * 3 + 6)
  }
end

(1..5).each{|i| B(A(i), i)}

