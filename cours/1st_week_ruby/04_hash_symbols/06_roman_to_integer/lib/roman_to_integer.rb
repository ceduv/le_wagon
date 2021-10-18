ROMAN_TO_INT = {
  "I" => 1,
  "IV" => 4,
  "V" => 5,
  "IX" => 9,
  "X" => 10,
  "XL" => 40,
  "L" => 50,
  "XC" => 90,
  "C" => 100,
  "CD" => 400,
  "D" => 500,
  "CM" => 900,
  "M" => 1000
}

# rubocop:disable Metrics/MethodLength
def roman_to_integer(roman_string)
  number = 0
  str = roman_string.dup # Clone the string to use destructive method on it.
  until str.size.zero?
    last_two_characters = str.slice(-2, 2)
    if ROMAN_TO_INT.key?(last_two_characters)
      number += ROMAN_TO_INT[last_two_characters]
      str.chop!
    else
      number += ROMAN_TO_INT[str.slice(-1)]
    end
    str.chop!
  end
  number
end
# rubocop:enable Metrics/MethodLength
