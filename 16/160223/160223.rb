=begin
1～nまでの和がn(n + 1) / 2なので、
1～nの中からいくつか選び、和がn(n + 1) / 4
となるものを数えればよい。
=end
 
def A063865(n)
  ary = [1]
  m = n * (n + 1) / 4
  a = Array.new(m + 1){0}
  a[0] = 1
  (1..n).each{|i|
    b = a.clone
    (0..[(i - 1) * i / 2, m - i].min).each{|k| b[k + i] += a[k]}
    a = b
    i * (i + 1) % 4 == 0 ? ary << a[i * (i + 1) / 4] : ary << 0
  }
  ary
end

p A063865(4000)[-1]
