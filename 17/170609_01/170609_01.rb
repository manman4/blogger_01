def A16(n)
  m = 2 * n + 4
  s = 0
  1.step(m, 2){|b|
    (b + 2).step(m, 2){|a|
      1.step(m, 2){|x|
        1.step(m, 2){|y|
          s += a * b * (a * a - b * b) ** 2 if a * x + b * y == m
        }
      }
    }
  }
  s / 192
end

def A36(n)
  m = 2 * n + 9
  s = 0
  1.step(m, 2){|c|
    (c + 2).step(m, 2){|b|
      (b + 2).step(m, 2){|a|
        1.step(m, 2){|x|
          1.step(m, 2){|y|
            1.step(m, 2){|z|
              s += a * b * c * ((a * a - b * b) * (a * a - c * c) * (b * b - c * c)) ** 2 if a * x + b * y + c * z == m
            }
          }
        }
      }
    }
  }
  s / 141557760
end

n = 10
p (0..n).map{|i| A16(i)}
p (0..n).map{|i| A36(i)}
