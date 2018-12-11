def cut_rectangle(h, w)
  if h.odd?
    return 0  if w.odd?
    h, w = w, h
  end
  return 1 if w == 1

  nxt = [[w+1, 1, 0], [-w-1, -1, 0], [-1, 0, -1], [1, 0, 1]]  # [next,dy,dx]
  blen = (h + 1) * (w + 1) - 1
  grid = [false] * (blen + 1)

  walk = lambda do |y, x, count=0|
    return count+1  if y==0 or y==h or x==0 or x==w
    t = y * (w + 1) + x
    grid[t] = grid[blen - t] = true
    nxt.each do |nt, dy, dx|
      count += walk[y + dy, x + dx]  unless grid[t + nt]
    end
    grid[t] = grid[blen - t] = false
    count
  end

  t = h / 2 * (w + 1) + w / 2
  if w.odd?
    grid[t] = grid[t + 1] = true
    count = walk[h / 2, w / 2 - 1]
    count + walk[h / 2 - 1, w / 2] * 2
  else
    grid[t] = true
    count = walk[h / 2, w / 2 - 1]
    return count * 2  if h == w
    count + walk[h / 2 - 1, w / 2]
  end
end

tests = [[4,3],[4,5],[5,4],[5,6],[6,3],[6,5],[7,4],[7,6],[8,3]]
tests.each do |try|
  puts cut_rectangle(try[0],try[1])
end
