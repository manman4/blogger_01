(1..9).to_a.permutation{|i|
  a, b = i[0..4].join.to_i, i[5..-1].join.to_i
  if (a - b) % 11111 == 0
    puts "#{a} - #{b} = #{a - b}"
  elsif (a + b) % 11111 == 0
    puts "#{a} + #{b} = #{a + b}"
  end
}