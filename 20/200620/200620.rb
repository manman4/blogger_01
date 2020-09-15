require 'bigdecimal'

def A(n)
  puts "1/#{n}"
  if n == 1
    print "= 0." + "9" * 50
  else
    print "= " + BigDecimal(1r / n, 50).to_s("F")[0..51]
  end
  puts "..."
end

def B(n)
  m = 10 ** n - 1
  (1..Math.sqrt(m)).each{|i|
    if m % i == 0
      A(i)
      A(m / i)
    end
  }
end

(1..7).each{|i| B(i)}