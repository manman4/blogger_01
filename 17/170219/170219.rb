require 'prime'

def power0(a, n)
  return 1 if n == 0
  k = power0(a, n >> 1)
  k *= k
  return k if n & 1 == 0
  return k * a
end

# x > 0
def sigma(x, i)
  sum = 1
  pq = i.prime_division
  pq.each{|a, n| sum *= (power0(a, (n + 1) * x) - 1) / (power0(a, x) - 1)}
  sum
end

def bernoulli(n)
  ary = []
  a = []
  (0..n).each{|i|
    a << 1r / (i + 1)
    i.downto(1){|j| a[j - 1] = j * (a[j - 1] - a[j])}
    ary << a[0] # Bn = a[0]
  }
  ary
end

def E_2k(k, n)
  a = -4 * k / bernoulli(2 * k)[-1]
  b = a.denominator
  c = a.numerator
  [b] + (1..n).map{|i| c * sigma(2 * k - 1, i)}
end

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
def power(ary, n, m)
  return [1] if n == 0
  k = power(ary, n >> 1, m)
  k = mul(k, k, m)
  return k if n & 1 == 0
  return mul(k, ary, m)
end

def f(i, j, n)
  mul(power(@q_ary, i, n), power(@r_ary, j, n), n)
end

def show(e, ary0, ary1)
  print "#{e} = "
  (0..ary0.size - 1).each{|i|
    j = ary1[i]
    if i == 0
      if j < 0
        print "-#{ary0[i]} * #{-ary1[i]}"
      else
        print "#{ary0[i]} * #{ary1[i]}"
      end
    else
      if j < 0
        print " - #{ary0[i]} * #{-ary1[i]}"
      else
        print " + #{ary0[i]} * #{ary1[i]}"
      end
    end
  }
  puts
end

n = 10
@q_ary = E_2k(2, n)
@r_ary = E_2k(3, n)

e_ary = E_2k(6, n)
c_ary = [441, 250]
f_ary0, f_ary1 = f(3, 0, n), f(0, 2, n)
(0..n).each{|i| show(e_ary[i], c_ary, [f_ary0[i], f_ary1[i]])}
p ""
e_ary = E_2k(7, n)
c_ary = [1]
f_ary0 = f(2, 1, n)
(0..n).each{|i| show(e_ary[i], c_ary, [f_ary0[i]])}
p ""
e_ary = E_2k(8, n)
c_ary = [1617, 2000]
f_ary0, f_ary1 = f(4, 0, n), f(1, 2, n)
(0..n).each{|i| show(e_ary[i], c_ary, [f_ary0[i], f_ary1[i]])}
p ""
e_ary = E_2k(9, n)
c_ary = [38367, 5500]
f_ary0, f_ary1 = f(3, 1, n), f(0, 3, n)
(0..n).each{|i| show(e_ary[i], c_ary, [f_ary0[i], f_ary1[i]])}
p ""
e_ary = E_2k(10, n)
c_ary = [53361, 121250]
f_ary0, f_ary1 = f(5, 0, n), f(2, 2, n)
(0..n).each{|i| show(e_ary[i], c_ary, [f_ary0[i], f_ary1[i]])}
p ""
e_ary = E_2k(11, n)
c_ary = [57183, 20500]
f_ary0, f_ary1 = f(4, 1, n), f(1, 3, n)
(0..n).each{|i| show(e_ary[i], c_ary, [f_ary0[i], f_ary1[i]])}
p ""
e_ary = E_2k(12, n)
c_ary = [49679091, 176400000, 10285000]
f_ary0, f_ary1, f_ary2 = f(6, 0, n), f(3, 2, n), f(0, 4, n)
(0..n).each{|i| show(e_ary[i], c_ary, [f_ary0[i], f_ary1[i], f_ary2[i]])}
p ""
e_ary = E_2k(13, n)
c_ary = [392931, 265000]
f_ary0, f_ary1 = f(5, 1, n), f(2, 3, n)
(0..n).each{|i| show(e_ary[i], c_ary, [f_ary0[i], f_ary1[i]])}
p ""
e_ary = E_2k(14, n)
c_ary = [489693897, 2507636250, 395450000]
f_ary0, f_ary1, f_ary2 = f(7, 0, n), f(4, 2, n), f(1, 4, n)
(0..n).each{|i| show(e_ary[i], c_ary, [f_ary0[i], f_ary1[i], f_ary2[i]])}
p ""
e_ary = E_2k(15, n)
c_ary = [815806500201, 881340705000, 26021050000]
f_ary0, f_ary1, f_ary2 = f(6, 1, n), f(3, 3, n), f(0, 5, n)
(0..n).each{|i| show(e_ary[i], c_ary, [f_ary0[i], f_ary1[i], f_ary2[i]])}
p ""
e_ary = E_2k(16, n)
c_ary = [764412173217, 5323905468000, 1621003400000]
f_ary0, f_ary1, f_ary2 = f(8, 0, n), f(5, 2, n), f(2, 4, n)
(0..n).each{|i| show(e_ary[i], c_ary, [f_ary0[i], f_ary1[i], f_ary2[i]])}
p ""
