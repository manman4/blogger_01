def A24(n)
  m = n + 3
  s = 0
  (1..m).each{|b|
    (b + 1..m).each{|a|
      1.step(m, 2){|x|
        1.step(m, 2){|y|
          s += (a * b) ** 3 * (a * a - b * b) ** 2 if a * x + b * y == m
        }
      }
    }
  }
  s / 72
end

def A48(n)
  m = n + 6
  s = 0
  (1..m).each{|c|
    (c + 1..m).each{|b|
      (b + 1..m).each{|a|
        1.step(m, 2){|x|
          1.step(m, 2){|y|
            1.step(m, 2){|z|
              s += (a * b * c) ** 3 * ((a * a - b * b) * (a * a - c * c) * (b * b - c * c)) ** 2 if a * x + b * y + c * z == m
            }
          }
        }
      }
    }
  }
  s / 3110400
end

n = 15
p (0..n).map{|i| A24(i)}
p (0..n).map{|i| A48(i)}
