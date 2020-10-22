require 'prime'

def A(n)
  ary = [0, 1]
  (2..n).each{|i|
    a = i.prime_division
    # i = p^q
    if a.size == 1
      s, t, u = 0, 1, 0
      (1..n).each{|j|
        t += 9 * j
        u += j
        break if i <= u
        s += (-1) ** (j % 2 + 1) * (2 * j + 1) * (i - t) * ary[-u]
      }
      ary << s / (i - 1)
    else
      s = 1
      a.each{|j|
        k, l = j[0], j[1]
        if l == 1
          s *= ary[k]
        else
          s *= ary[k ** (l - 1)] * ary[k] - k ** 11 * ary[k ** (l - 2)]
        end
      }
      ary << s
    end
  }
  ary[1..-1]
end

n = 458329
p A(n)[-1]
