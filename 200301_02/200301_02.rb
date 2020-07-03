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

def A(k, n)
  ary = []
  x = [1]
  a = [1] * k
  (n + 1).times{|i|
    ary << x
    x = mul(x, a, k * (i + 1))
  }
  ary.flatten
end

def B(k, n)
  ary = []
  x = [1]
  a = (1..k).to_a
  (n + 1).times{|i|
    ary << x
    x = mul(x, a, k * (i + 1))
  }
  ary.flatten
end

def A329708(n)
  ary = []
  (0..n).each{|i|
    a = (1..i + 1).to_a
    ary << mul(a, a, 2 * i)
  }
  ary.flatten
end

(1..5).each{|i| p A(i, 10)}
(1..5).each{|i| p B(i, 10)}
p A329708(10)

