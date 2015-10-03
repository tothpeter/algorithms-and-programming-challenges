class FizzBuzz
  def self.simple
    result = []

    (1..100).each do |number|
      if number % 15 == 0
        result << 'FizzBuzz'
      elsif number % 3 == 0
        result << 'Fizz'
      elsif number % 5 == 0
        result << 'Buzz'
      else
        result << number
      end
    end

    puts result.join ', '
  end
end
