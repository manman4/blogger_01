def A(r)
  xy = Array.new(r + 1){Array.new(r + 1, '□')}
  a, x, y = r, 0, r
  while x <= y
    xy[x][y], xy[y][x] = '■', '■'
    a, x = a - x - x - 1, x + 1
    a, y = a + y + y - 1, y - 1 if a < 0
  end
  xy.each{|i| p i.join}
end

(0..20).each{|i| A(i)}

