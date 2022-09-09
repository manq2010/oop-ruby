## Recursion

def factorial(n)
  if n == 0
    1
  else
    n * factorial(n - 1)
  end
end

p factorial(5)

p '################'

def palindrome(string)
  if string.length == 1 || string.length == 0
    true
  elsif string[0] == string[-1]
    palindrome(string[1..-2])
  else
    false
  end
end

p palindrome('aba')

p '##############'

def bottles(n)
  if n == 0
    puts 'no more bottles of beer on the wall'
  else
    puts "#{n} bottles of beer on the wall"
    bottles(n - 1)
  end
end

p bottles(4)

p '################'

def fib(n)
  if n == 0
    0
  elsif n == 1
    1
  else
    fib(n - 1) + fib(n - 2)
  end
end

p fib(7)

p '##############'

# def flatten(array, result = [])
#     array.each do |element|
#       if element.kind_of?(Array.
#         flatten(element, result)
#       else
#         result << element
#       end
#     end
#     result
#   end

#   # EASY METHOD:
#    array.flatten

#   p flatten([[1, [8, 9]], [3, 4]])

def integer_to_roman(roman_mapping, number, result = '')
  return result if number == 0

  roman_mapping.keys.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    result << roman_mapping[divisor] * quotient
    return integer_to_roman(roman_mapping, modulus, result) if quotient > 0
  end
end

roman_mapping = {
  1000 => 'M',
  900 => 'CM',
  500 => 'D',
  400 => 'CD',
  100 => 'C',
  90 => 'XC',
  50 => 'L',
  40 => 'XL',
  10 => 'X',
  9 => 'IX',
  5 => 'V',
  4 => 'IV',
  1 => 'I'
}

p integer_to_roman(roman_mapping, 48)

p '##############'

def roman_to_integer(roman_mapping, str, result = 0)
  return result if str.empty?

  roman_mapping.keys.each do |roman|
    next unless str.start_with?(roman)

    result += roman_mapping[roman]
    str = str.slice(roman.length, str.length)
    return roman_to_integer(roman_mapping, str, result)
  end
end

roman_mapping = {
  'M' => 1000,
  'CM' => 900,
  'D' => 500,
  'CD' => 400,
  'C' => 100,
  'XC' => 90,
  'L' => 50,
  'XL' => 40,
  'X' => 10,
  'IX' => 9,
  'V' => 5,
  'IV' => 4,
  'I' => 1
}

p roman_to_integer(roman_mapping, 'DXVM')
