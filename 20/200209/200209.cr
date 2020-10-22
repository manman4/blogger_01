require "big"

def sum_of_primes(n)
  m = Math.sqrt(n).to_i
  keys = (1..m).map{|i| n // i}
  keys += (1..keys[-1] - 1).to_a.reverse
  h = Hash(Int32, BigInt).new
  keys.each{|i|
    j = i.to_big_i
    h[i] = j * (j + 1) // 2 - 1
  }
  (2..m).each{|i|
    if h[i] > h[i - 1] # このときiは素数
      hp = h[i - 1]
      i2 = i * i
        keys.each{|j|
          break if j < i2
          h[j] -= i * (h[j // i] - hp)
        }
    end
  }
  h[n]
end

time = Time.local
p (0..9).map{|i| sum_of_primes(10 ** i)}
puts Time.local - time
