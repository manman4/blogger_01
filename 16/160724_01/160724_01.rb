def A2(ary)
  # i_maxは大きめにとっておく
  i_max = 15
  m = ary.size
  a_ary = [ary]
  i = 0
  while (i == 0 || a_ary[i] != ary) && i < i_max
    a_ary << Array.new(m, 1)
    (m - 2).downto(1){|j|
      x, y = a_ary[i][j - 1] * a_ary[i + 1][j + 1] + 1, a_ary[i][j]
      if x % y > 0
        i = i_max
        break
      else
        a_ary[i + 1][j] = x / y
      end
    }
    i += 1
  end
  if i < i_max
    (0..i).each{|i| p a_ary[i]}
    p ""
    return a_ary.uniq!
  end
  []
end

def c(n)
  (n + 2..2 * n).inject(:*) / (2..n).inject(:*)
end

def A3(n)
  p n
  a = []
  b = Array.new(n + 1, 0)
  # mは大きめにとっておく
  m = 5
  (1..m).to_a.repeated_permutation(n - 3){|i|
    i = [1] + i + [1]
    if !a.include?(i)
      a2 = A2(i)
      if a2 != []
        a += a2
        b[a2.size] += 1
      end
    end
    break if a.size >= c(n - 2)
  }
  p [a.size, b]
end

A3(9)

