# N voracious fish are moving along a river. Calculate how many fish are alive.

# Approach: when 2 fish meet, one has to die for sure, then reduce the live counter
def solution1 fish_sizes, fish_directions
  alive_counter = fish_directions.length

  fish_flowing_down = []

  fish_sizes.zip(fish_directions).each do |size, direction|
    if direction == 1
      fish_flowing_down << size
    else
      # fight!
      while fish_flowing_down.any? && fish_flowing_down.last < size
        fish_flowing_down.pop
        alive_counter -= 1
      end

      # Has the new fish won?
      if fish_flowing_down.any?
        alive_counter -= 1
      end
    end
  end

  alive_counter
end


# Approach: count the survivals isntead of the deaths
def solution2 fish_sizes, fish_directions
  survive_counter = 0

  fish_flowing_down = []

  fish_sizes.zip(fish_directions).each do |size, direction|
    if direction == 1
      fish_flowing_down << size
    else
      # fight!
      while fish_flowing_down.any? && fish_flowing_down.last < size
        fish_flowing_down.pop
      end

      if fish_flowing_down.empty?
        survive_counter += 1
      end
    end
  end

  fish_flowing_down.length + survive_counter
end
