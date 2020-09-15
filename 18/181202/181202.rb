def search(a, num, d, k, n)
  if num == 0
    @cnt += 1
  else
    (2 * n - 1).times{|i|
      if a[i] == 0
        (i + d + 1..2 * n - 1).each{|j|
          if a[j] == 0
            a[i], a[j] = num, num
            search(a, num - 1, j - i - k, k, n)
            a[i], a[j] = 0, 0
          end
        }
      end
    }
  end
end

def A(k, n)
  a = [0] * 2 * n
  @cnt = 0
  search(a, n, 0, k, n)
  @cnt
end

puts "A060963"
p (0..9).map{|i| A(0, i)}
puts "A322178"
p (0..7).map{|i| A(1, i)}

