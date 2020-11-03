def calc(num1, num2, operator)
  a, b = num1.to_f, num2.to_f
  return a + b if operator == "+"
  return a - b if operator == "-"
  return a * b if operator == "*"
  return a / b if operator == "/"
end

def solveRPN(str)
  stack = []
  datas = str.split(" ")
  datas.each{|data|
    # dataが数字のとき
    if data =~ /\d/
      stack << data
    # dataが記号のとき
    else
      p2 = stack.pop
      p1 = stack.pop
      stack << calc(p1, p2, data)
    end
  }
  stack
end

puts solveRPN("10 4 3 + 2 * -")
puts solveRPN("12 2 / 3 /")
