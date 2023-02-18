require "big"

struct BigInt
  def add!(other : BigInt) : BigInt
    LibGMP.add(self, self, other)
    self
  end
end

def fib(n)
  a = 0.to_big_i
  b = 1.to_big_i
  n.times{|i|
    a.add!(b)
    a, b = b, a
    puts "#{i + 1} : #{a}"
  }
end

time = Time.local
fib(100)
puts Time.local - time

