a = [1, 2, 3]

p a.permutations
# 以下はだめ
# a.permutations{|i| p i}
a.each_permutation{|i| p i}

p a.repeated_permutations
# 以下はだめ
# a.repeated_permutations{|i| p i}
a.each_repeated_permutation{|i| p i}
