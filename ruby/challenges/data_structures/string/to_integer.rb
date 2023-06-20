class String
  def to_integer
    str = self
    return nil unless str =~ /^-?\d+$/

    if str[0] == '-'
      str = str[1..-1]
      sign = -1
    else
      sign = 1
    end

    number = 0

    str.chars.each do |char|
      number *= 10
      number += char.ord - 48
    end

    number * sign
  end
end
