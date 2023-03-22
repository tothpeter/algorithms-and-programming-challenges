class FizzBuzz
  def self.simple
    (1..100).each do |number|
      if number % 15 == 0
        print('FizzBuzz')
      elsif number % 3 == 0
        print('Fizz')
      elsif number % 5 == 0
        print('Buzz')
      else
        print(number)
      end
    end
  end
end
