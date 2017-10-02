# Determine whether a triangle can be built from a given set of edges.

def solution list
  return 0 if list.length < 3

  list.sort!

  list.each_cons(3).each do |a, b, c|
    return 1 if a + b > c
  end

  return 0
end
