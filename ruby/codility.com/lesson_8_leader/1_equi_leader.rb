# Find the index S such that the leaders of the sequences A[0], A[1], ..., A[S] and A[S + 1], A[S + 2], ..., A[N - 1] are the same.

def solution1 list
  leaders_of_first_half = leaders_of list
  leaders_of_last_half  = leaders_of(list.reverse).reverse

  number_of_equi_leaders = 0

  leaders_of_first_half.zip(leaders_of_last_half).each do |leader1, leader2|
    if !leader1.nil? && leader1 == leader2
      number_of_equi_leaders += 1
    end
  end

  number_of_equi_leaders
end

def leaders_of list
  leaders = []

  stat = Hash.new { |h, k| h[k] = 0 }
  most_frequent = nil
  most_frequent_count = 0

  list.each_with_index do |item, index|
    break if index == list.length - 1

    stat[item] += 1

    if stat[item] > most_frequent_count
      most_frequent = item
      most_frequent_count = stat[item]
    end

    if most_frequent_count > ((index + 1) / 2)
      leaders << most_frequent
    else
      leaders << nil
    end
  end

  leaders
end
