class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  # public    # This method can be called from outside the class.

  def about_me
    puts "I'm #{@name} and I'm #{@age} years old!"
  end

  private # This method can't!

  def bank_account_number
    @account_number = 12_345
    puts "My bank account number is #{@account_number}."
  end
end

eric = Person.new('Eric', 26)
eric.about_me
eric.bank_account_number
# script_2.rb:23:in `<main>': private method `bank_account_number' called for #<Person:0x00007fcb7c4c2530 @name="Eric", @age=26> (NoMethodError)
# eric.bank_account_number
# ^^^^^^^^^^^^^^^^^^^^

# attr_reader, attr_writer

# class Person

#     def initialize(name, job)
#         @name = name
#         @job = job
#     end

#     def name
#         @name
#     end

#     def job=(new_job)
#         @job = new_job
#     end
# end

class Person
  def initialize(name, job)
    @name = name
    @job = job
  end

  attr_reader :name
  attr_writer :job
end

class Person2
  attr_reader :name
  attr_accessor :job

  def initialize(name, job)
    @name = name
    @job = job
  end
end

# #############################

class Angle
  include Math
  attr_accessor :radians

  def initialize(radians)
    @radians = radians
  end

  def cosine
    cos(@radians)
  end
end

acute = Angle.new(1)
acute.cosine

# The Marriage of Modules and Classes

module Action
  def jump
    @distance = rand(2..5)
    puts "I jumped forward #{@distance} feet!"
  end
end

class Rabbit
  include Action
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Cricket
  include Action
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new('Peter')
jiminy = Cricket.new('Jiminy')

peter.jump
jiminy.jump

####################

# ThePresent has a .now method that we'll extend to TheHereAnd

module ThePresent
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}:#{Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end
end

class TheHereAnd
  extend ThePresent
end

TheHereAnd.now

# ########################

class Application
  attr_accessor :status

  def initialize; end
  # Add your method here!

  def print_status
    puts 'All systems go!'
  end
end

# ###############

module Languages
  FAVE = 'Ruby'  # This is what you typed before, right? :D
end

class Master
  include Languages
  def initialize; end

  def victory
    puts FAVE
  end
end

total = Master.new
total.victory
