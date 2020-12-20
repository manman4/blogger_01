# d個とばし
def search(a, num, d, k, n)
  if num == 0
    @cnt += 1
  else
    # iはk * n - k以下、jはk * n - k + 1以下
    (k * n - k + 1).times{|i|
      if a[i] == 0
        (i + d + 1..k * n - k + 1).each{|j|
          if (k - 1) * j - (k - 2) * i < k * n
            if (1..k - 1).all?{|m| a[m * j - (m - 1) * i] == 0}
              (0..k - 1).each{|m| a[m * j - (m - 1) * i] = num}
              search(a, num - 1, j - i - 1, k, n)
              (0..k - 1).each{|m| a[m * j - (m - 1) * i] = 0}
            end
          end
        }
      end
    }
  end
end

def A(k, n)
  a = [0] * k * n
  @cnt = 0
  search(a, n, 0, k, n)
  @cnt
end

(2..7).each{|i| p [i, (0..6).map{|j| A(i, j)}]}

