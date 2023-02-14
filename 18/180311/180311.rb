# m次以下を取り出す
def mul(f_ary, b_ary, m)
  s1, s2 = f_ary.size, b_ary.size
  ary = Array.new(s1 + s2 - 1, 0)
  (0..s1 - 1).each{|i|
    (0..s2 - 1).each{|j|
      ary[i + j] += f_ary[i] * b_ary[j]
    }
  }
  ary[0..m]
end

def A(n)
  p [0, ary = [1]]
  (1..n).each{|i|
    b_ary = Array.new(i + 1, 0)
    b_ary[0], b_ary[-1] = 1, 1
    ary = mul(ary, b_ary, i * (i + 1) / 2)
    ary0 = []
    (0..i).each{|j|
      ary0 << j.step(ary.size - 1, i + 1).inject(0){|s, k| s + ary[k]}
    }
    p [i, ary0]
  }
end

A(50)
