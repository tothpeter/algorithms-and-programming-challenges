# Find the minimal nucleotide from a range of sequence DNA.

# Rather readable/easy solution but not so performatic
# time complexity:  O(bottom_limits.length * dna_string.length)
# space complexity: O(dna_string.length)

def solution1 dna_string, bottom_limits, top_limits
  nucleotide_impact_map = {
    'A' => 1,
    'C' => 2,
    'G' => 3,
    'T' => 4
  }

  nucleotides_impact = dna_string.chars.map do |nucleotide|
    nucleotide_impact_map[nucleotide]
  end

  bottom_limits.zip(top_limits).map do |bottom_limit, top_limit|
    nucleotides_impact[bottom_limit..top_limit].min
  end
end

# Optimized for computing but not so good for space
# time complexity:  O(bottom_limits.length + dna_string.length)
# space complexity: O(dna_string.length^2 + dna_string.length)

def solution2 dna_string, bottom_limits, top_limits
  nucleotide_impact_map = {
    'A' => 1,
    'C' => 2,
    'G' => 3,
    'T' => 4
  }

  result = []

  nucleotides_impact = dna_string.chars.map do |nucleotide|
    nucleotide_impact_map[nucleotide]
  end

  cache = {}

  (nucleotides_impact.length - 2).times do |start_index|
    ((start_index + 1)..(nucleotides_impact.length - 1)).each do |end_index|
      cache["#{start_index}_#{end_index}"] = nucleotides_impact[start_index..end_index].min
    end
  end

  bottom_limits.zip(top_limits).each do |bottom_limit, top_limit|
    if bottom_limit == top_limit
      result << nucleotides_impact[bottom_limit]
    else
      result << cache["#{bottom_limit}_#{top_limit}"]
    end
  end

  result
end


# Optimized for computing and for space
# time complexity:  O(bottom_limits.length + dna_string.length)
# space complexity: O(dna_string.length)
def solution3 dna_string, bottom_limits, top_limits
  nucleotide_impact_map = {
    'A' => 1,
    'C' => 2,
    'G' => 3,
    'T' => 4
  }

  nucleotide_appearances = Hash.new { |h, k| h[k] = Array.new(dna_string.length + 1, 0) }

  # Expected nucleotide_appearances for 'CAGCCTA'
  # {
  #   "A"=>[0, 0, 1, 1, 1, 1, 1, 2],
  #   "C"=>[0, 1, 1, 1, 2, 3, 3, 3],
  #   "G"=>[0, 0, 0, 1, 1, 1, 1, 1],
  #   "T"=>[0, 0, 0, 0, 0, 0, 1, 1]
  # }

  dna_string.chars.each_with_index do |nucleotide, index|
    # Copy the previous appearance
    nucleotide_impact_map.keys.each do |key|
      nucleotide_appearances[key][index + 1] = nucleotide_appearances[key][index]
    end

    # Increment the appearance of the current nucleotide
    nucleotide_appearances[nucleotide][index + 1] += 1
  end

  result = []

  bottom_limits.zip(top_limits).each do |bottom_limit, top_limit|
    nucleotide_appearances.each do |nucleotide, appearances|
      # Has nucleotide appeared between the bottom and top limits
      if appearances[top_limit + 1] > appearances[bottom_limit]
        result << nucleotide_impact_map[nucleotide]
        break
      end
    end
  end

  result
end
