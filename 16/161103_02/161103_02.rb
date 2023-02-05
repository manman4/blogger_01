require 'prime'

def f(m, n)
  (1..9).each{|i|
    if i != m
      (1..n).each{|j|
        k = ([i] * j + [m]).join.to_i
        if k.prime?
          p [j, k, 'prime']
        else
          p [j, k, k.prime_division]
        end
      }
    end
  }
end

f(1, 17)
