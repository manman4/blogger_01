def A053614()
  # 37以上の自然数は異なる三角数の和で表されることが証明できているものとする
  ary = [1, 3, 6, 10, 15, 21, 28, 36]
  a_ary = []
  (1..ary.size).each{|i|
    ary.combination(i){|c|
      a_ary << c.inject(:+)
    }
  }
  (1..36).to_a - a_ary.uniq
end
ary = A053614()

# OEIS A053614のデータ
ary0 =
[2,5,8,12,23,33]
# 一致の確認
p ary == ary0
