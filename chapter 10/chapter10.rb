# def ask_recursively(question)
#   puts question
#   reply = gets.chomp.downcase
#
#   if reply == 'yes'
#     true
#   elsif reply == 'no'
#     false
#   else
#     puts 'Please answer "yes" or "no".'
#     ask_recursively(question)
#   end
# end
#
# ask_recursively("Do you like to code?")

###################################################################
# factorial with recursion
###################################################################

# def factorial num
#   if num < 0
#     return "You can't take the factororial of a negative number!"
#   end
#
#   if num <= 1
#     1
#   else
#     num * factorial(num-1)
#   end
# end
#
# puts factorial(4)
# puts factorial(3)

###################################################################
# recursion
###################################################################

# These are just to make the map easier for me to read. "M"
# visually more dense than "o".

# M = 'land'
# o = 'water'
#
# world = [[o,o,o,o,o,M,o,o,o,o,o],
#          [o,o,o,o,M,M,o,o,o,o,o],
#          [o,o,o,o,o,M,o,o,M,M,o],
#          [o,o,o,M,o,M,o,o,o,M,o],
#          [o,o,o,o,o,M,M,o,o,o,o],
#          [o,o,o,o,M,M,M,M,o,o,o],
#          [M,M,M,M,M,M,M,M,M,M,M],
#          [o,o,o,M,M,o,M,M,M,o,o],
#          [o,o,o,o,o,o,M,M,o,o,o],
#          [o,M,o,o,o,M,M,o,o,o,o],
#          [o,o,o,o,o,M,o,o,o,o,o],
#          [o,o,o,o,o,o,o,o,o,o,o]]
#
# def continent_size world, x, y
#   if x < 0 || x > 10 || y < 0 || y > 10
#     return 0
#   end
#
#   if world[y][x] != 'land'
#     # Either it's water or we already
#     # counted it. but either way, we don't
#     # want to count it now
#     return 0
#   end
#
#   # So first we count this tile...
#   size = 1
#   world[y][x] = 'counted land'
#
#   # .. then we count all of the
#   # neighboring eight tiles (and,
#   # way of the recursion).
#
#   size += continent_size(world, x-1, y-1)
#   size += continent_size(world, x  , y-1)
#   size += continent_size(world, x+1, y-1)
#   size += continent_size(world, x-1, y-1)
#   size += continent_size(world, x-1  , y)
#   size += continent_size(world, x+1  , y)
#   size += continent_size(world, x-1, y+1)
#   size += continent_size(world, x  , y+1)
#   size += continent_size(world, x+1, y+1)
#
#   size
# end
#
# puts continent_size(world, 5, 5)
###################################################################
# sorting
###################################################################


# def sort (to_sort)
#   sorted = false
#
#   until sorted
#     sorted = true
#
#     for index in 0..(to_sort.length - 2)
#       if to_sort[index] > to_sort[index + 1]
#         sorted = false
#         to_sort[index], to_sort[index + 1] = to_sort[index + 1],
#         to_sort[index]
#       end
#     end
#   end
#   return to_sort
# end
#
# to_be = [3, 4, 2, 1, 5, 9, 7, 8, 6]

# puts sort(to_be)
#
# def sort_list(list)
#   list = list.split(' ').map(&:to_f)
#   sorted_list = []
#   place_holder = 0
#   while list.length > place_holder
#     sort_list << list.min
#     list.delete(list.min)
#   end
#   sorted = sorted_list.join(' ')
#   sorted
# end

###################################################################
# english number
###################################################################

def english_number number
  if number < 0 # no neg numbers
    return 'Please enter a number that isn\'t negative'
  end
  if number == 0
    return 'zero'
  end

  # no more special cases, no more returns

  num_string = '' # This is the string we will return, define it an start 'empty'

  ones_place = [ 'one', 'two', 'three',
                 'four', 'five', 'six',
                 'seven', 'eight', 'nine']

  tens_place = [ 'ten', 'twenty', 'thirty',
                 'forty', 'fifty', 'sixty',
                 'seventy', 'eighty', 'ninty']

  teenagers = [ 'eleven', 'twelve', 'thirteen',
                'fourteen', 'fifteen', 'sixteen',
                'seventeen', 'eighteen', 'nineteen']


  # "left" is how much of the number we still have to write
  # "write" is which part we are writing out at the time

  left = number

  # trillions
  write = left/1000000000000
  left = left - write*1000000000000

  if write > 0
    trillions = english_number write
    num_string = num_string + trillions + ' trillion'

    if left > 0
      num_string = num_string + ' '
    end
  end

  # billions
  write = left/1000000000
  left = left - write*1000000000

  if write > 0
    billions = english_number write
    num_string = num_string + billions + ' billion'

    if left > 0
      num_string = num_string + ' '
    end
  end

  # millions
  write = left/1000000
  left = left - write*1000000

  if write > 0
    millions = english_number write
    num_string = num_string + millions + ' million'

    if left > 0
      num_string = num_string + ' '
    end
  end

  # thousands
  write = left/1000
  left = left - write*1000

  if write > 0
    thousands = english_number write
    num_string = num_string + thousands + ' thousand'

    if left > 0
      num_string = num_string + ' '
    end
  end

  write = left/100 # how many hundreds left
  left = left - write*100 # subtract off those hundreds

  if write > 0
    # recursion
    hundreds = english_number write
    num_string = num_string + hundreds + ' hundred'

    if left > 0
      # adds a space
      num_string = num_string + ' '
    end
  end

  write = left/10 # how many tens left
  left = left - write*10 # subtract off those tens

  if write > 0
    if ((write == 1) and (left > 0))
      # exception for teenagers
      num_string = num_string + teenagers[left-1]
      # -1 because of the array ordering [0] is eleven etc.
      # with teenagers the digit in the ones place is taken care of so nothing left
      left = 0
    else
      num_string = num_string + tens_place[write-1]
    end

    if left > 0
      # add a space
      num_string = num_string + '-'
    end
  end

  write = left # how many ones left
  left = 0 # subtract off those ones

  if write > 0
    num_string = num_string + ones_place[write-1]
  end

  # now we just return the num_string

  num_string
end

puts english_number( 0)
puts english_number( 9)
puts english_number( 10)
puts english_number( 11)
puts english_number( 17)
puts english_number( 32)
puts english_number( 88)
puts english_number( 99)
puts english_number(100)
puts english_number(101)
puts english_number(234)
puts english_number(3211)
puts english_number(999999)
puts english_number(1000000000000)
puts english_number(1000)
puts english_number(10000)
puts english_number(1000000)
puts english_number(10000000)
puts english_number(1000000000)
puts english_number(10000000000)
