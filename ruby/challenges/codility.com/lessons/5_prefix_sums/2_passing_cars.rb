# Count the number of passing cars on the road.

def solution car_directions
  cars_to_east_count = 0
  pair_count = 0

  car_directions.each do |car_direction|
    if car_direction == 0
      cars_to_east_count += 1
    else
      pair_count += cars_to_east_count
    end
  end

  pair_count
end


def solution_return_the_pairs car_directions
  group_cars = {}

  car_directions.each_with_index do |car_direction, index|
    if car_direction == 0
      group_cars[index] = []
    else
      group_cars.keys.each { |key| group_cars[key] << index }
    end
  end

  car_pairs = []

  group_cars.each do |car_to_east, cars_to_west|
    cars_to_west.each do |car_to_west|
      car_pairs << [car_to_east, car_to_west]
    end
  end

  car_pairs
end
