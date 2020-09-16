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

# m次以下を取り出す
def power0(ary, n, m)
  return [1] if n == 0
  k = power0(ary, n >> 1, m)
  k = mul(k, k, m)
  return k if n & 1 == 0
  return mul(k, ary, m)
end

# m次以下を取り出す
def power1(ary, n, m)
  if n == 0
    a = Array.new(m + 1, 0)
    a[0] = 1
    return a
  end
  k = power1(ary, n >> 1, m)
  k = mul(k, k, m)
  return k if n & 1 == 0
  return mul(k, ary, m)
end

m = 20
n = 10
ary = [1, 1]
(0..n).each{|i| p power0(ary, i, m)}
p ""
(0..n).each{|i| p power1(ary, i, m)}
p ""
# power0のように使うことも可能
(0..n).each{|i| p power1(ary, i, i)}
p ""
ary = [1, 1, 1]
(0..n).each{|i| p power0(ary, i, m)}
p ""
(0..n).each{|i| p power1(ary, i, m)}
p ""
# power0のように使うことも可能
(0..n).each{|i| p power1(ary, i, i * 2)}

