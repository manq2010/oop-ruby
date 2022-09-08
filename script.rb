class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end

  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new('Ruby', 'Yukihiro Matsumoto')
python = Language.new('Python', 'Guido van Rossum')
javascript = Language.new('JavaScript', 'Brendan Eich')

ruby.description
python.description
javascript.description

# ############################

class Person
  def initialize(name)
    @name = name
  end
end

me = Person.new('Mancoba')

# ##############################

class Computer
  $manufacturer = 'Mango Computer, Inc.'
  @@files = { hello: 'Hello, world!' }

  def initialize(username, password)
    @username = username
    @password = password
  end

  def current_user
    @username
  end

  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new('Dave', 12_345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.

# ####################################

class Person
  # Set your class variable to 0
  @@people_count = 0

  def initialize(name)
    @name = name
    # Increment your class variable
    @@people_count += 1
  end

  def self.number_of_instances
    # Return your class variable
    @@people_count
  end
end

matz = Person.new('Yukihiro')
dhh = Person.new('David')

puts "Number of Person instances: #{Person.number_of_instances}"

# ########################################

def create_record(attributes, raise_error = false)
  record = build_record(attributes)
  yield(record) if block_given?
  saved = record.save
  set_new_record(record)
  raise RecordInvalid, record if !saved && raise_error

  record
end

# ###########################################
# Inheritance

class ApplicationError
  def display_error
    puts 'Error! Error!'
  end
end

class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error

# Override!

class Creature
  def initialize(name)
    @name = name
  end

  def fight
    'Punch to the chops!'
  end
end

class Dragon < Creature
  def fight
    puts 'Breathes fire!'
    super
  end
end

##################

class Computer
  @@users = {}
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
    @time = Time.now
    @files[filename] = @time
    puts 'A new file created'
  end

#   def Computer.get_users
  def self.get_users
    @@users
  end
end

my_computer = Computer.new('admin', 'admin')
