# 商品の数と，それぞれの大きさ，価値
N = 5
size = [2,3,5,6,9]
value = [2,4,7,10,14]

# ナップザックの大きさ
NAP_SIZE = 16

# ナップザックの現時点での価値
nap_value= Array.new(NAP_SIZE + 1, 0)

printf("ナップザックの大きさ:")
for i in (1..NAP_SIZE)
  printf("%2d ",i)
end
printf("\n\n")

# 扱う品物を，1つずつ増やしていく
for i in (0..N - 1)
  # ナップザックの大きさがjのものに対して，品物i番を入れてみる
  for j in (size[i]..NAP_SIZE)
    # 品物iを入れてみた場合，新しい価値はどう変わるか
    new_value = nap_value[j - size[i]] + value[i]
    if new_value > nap_value[j]
      nap_value[j] = new_value
    end
  end
  printf("     品物 %dまで使う:",i+1)
  for j in (1..NAP_SIZE)
    printf("%2d ",nap_value[j])
  end
  printf("\n")
end

