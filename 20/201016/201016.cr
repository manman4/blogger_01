require "big"

def a063865(n)
  ary = [1.to_big_i]
  m = n * (n + 1) // 4
  a = Array.new(m + 1){0.to_big_i}
  a[0] = 1.to_big_i
  (1..n).each{|i|
    b = a.clone
    (0..[(i - 1) * i / 2, m - i].min).each{|k| b[k + i] += a[k]}
    a = b
    i * (i + 1) % 4 == 0 ? ary << a[i * (i + 1) // 4] : ary << 0.to_big_i
  }
  ary
end

p a063865(1000)[-1]
