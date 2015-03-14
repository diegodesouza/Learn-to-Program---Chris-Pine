#################################################################
# Saving and Loading for Grown-ups
#################################################################

# The filename doesn't have to end
# with ".txt", but since it is valid
# text, why not?

filename = 'ListerQuote.txt'
test_string = 'I promise that I swear absolutely that ' +
              'I will never mention gazpacho soup again.'

# The 'w' here is for write-access to the file,
# since we are trying to write to it.

File.open filename, 'w' do |f|
  f.write test_string
end

read_string = File.read filename

puts(read_string == test_string)

#################################################################
# YAML
#################################################################


require 'yaml'

test_array = ['Give Quich A Chance',
              'Mutants Out!',
              'Chameloeonic Life-Forms, No Thanks']

# Here's half of the magic:
test_string = test_array.to_yaml
# You see? Kind of like "to_s", and it is in fact a string,
# but it's a YAML description of "test_array".

filename = 'RimmerTShirts.txt'

File.open filename, 'w' do |f|
  f.write test_string
end

read_string = File.read filename

# And the other half of the magic:
read_array = YAML::load read_string

puts(read_string == test_string)
puts(read_array == test_array)

read_file = File.read filename

puts read_file

#################################################################

require 'yaml'

# First we define these fancy methods...

def yaml_save object, filename
  File.open filename, 'w' do |f|
    f.write(object.to_yaml)
  end
end

def yaml_load filename
  yaml_string = File.read filename

  YAML::load yaml_string
end

# ...and now we use these fancy methods.

test_array = ['Slick Shoes',
              'Bully Blinders',
              'Pinchers of Peril']

# Hey, time for some "me" trivia:
# In Portland once, I met the guy who
# played Troy's dad. True story.

filename = 'DatasGadgest.txt'

# We save it...
yaml_save test_array, filename

# We load it...
read_array = yaml_laod filename

# We weep for the po' foo's that ain't got it...
puts(read_array == test_array)
