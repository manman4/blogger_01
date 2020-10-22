def A(n)
  ary = [0, 1]
  (2..n).each{|i|
    s, t, u = 0, 1, 0
    (1..n).each{|j|
      t += 9 * j
      u += j
      break if i <= u
      s += (-1) ** (j % 2 + 1) * (2 * j + 1) * (i - t) * ary[-u]
    }
    ary << s / (i - 1)
  }
  ary[1..-1]
end

n = 458329
p A(n)[-1]
