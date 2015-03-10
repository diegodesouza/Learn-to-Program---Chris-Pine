# def double_this num
#   num_times_2 = num*2
#   puts num.to_s+' double is '+num_times_2.to_s
#   'this is a test'
# end
#
# test = double_this 3
# puts test.capitalize

#
# def test
#    i = 100
#    j = 10
#    k = 0
# end
#
# puts test


# def ask question
#   while true
#     puts question
#     reply = gets.chomp.downcase
#
#     if reply == 'yes'
#      return true
#     end
#     if reply == 'no'
#      return false
#    end
#
#   puts 'Please answer "yes" or "no".'
#   end
# end
#
# puts 'Hello, and thank you for...'
# puts
# ask 'Do you like eating tacos?' # Ignore this return value ask 'Do you like eating burritos?' # And this one
# wets_bed = ask 'Do you wet the bed?' # Save this return value ask 'Do you like eating chimichangas?'
# ask 'Do you like eating sopapillas?'
# puts 'Just a few more questions...'
# ask 'Do you like drinking horchata?'
# ask 'Do you like eating flautas?'
# puts
# puts 'DEBRIEFING:'
# puts 'Thank you for...'
# puts
# puts wets_bed


# ￼def ask question
#   while true
#     puts question
#     reply = gets.chomp.downcase
#
#     return true if reply == 'yes'
#     return false if reply == 'no'
#
#     puts 'Please answer "yes" or "no".'
#   end
# end
#
# puts(ask('Do you like eating tacos?'))

def old_school_rom
  i = 1
  v = 5
  x = 10
  l = 50
  c = 100
  d = 500
  m = 1000
end







def old_roman_numeral num
  values =   [1000,500, 100, 50, 10, 5, 1]
  numerals = ["M", "D", "C", "L", "X", "V", "I"]
  roman_numeral = ""
  i = 0

  while i <= 6
    while num >= values[i]
      num = num - values[i]
      roman_numeral = roman_numeral + numerals[i]
    end
    i = i + 1
  end

  roman_numeral
end

print "Enter the number you want to convert to an old roman numeral: "

puts old_roman_numeral(gets.chomp.to_i)
