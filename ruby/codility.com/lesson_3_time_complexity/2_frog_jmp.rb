# Time Complexity / FrogJmp
# Count minimal number of jumps from position X to Y.

def solution current_pos, target_pos, jump_size
  route_length = target_pos - current_pos

  (route_length / jump_size.to_f).ceil
end
