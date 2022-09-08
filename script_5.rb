module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts '---GoodDog ancestors---'
puts GoodDog.ancestors
puts ''
puts '---HumanBeing ancestors---'
puts HumanBeing.ancestors

# #################################

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  #   def change_info(n, h, w)
  #     @name = n
  #     @height = h
  #     @weight = w
  #   end

  #   def change_info(n, h, w)
  #     name = n
  #     height = h
  #     weight = w
  #   end

  # To disambiguate from creating a local variable, we need to use self.name= to let Ruby know that we're calling a method. So our change_info code should be updated to this:\

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  #   def info
  #     "#{name} weighs #{weight} and is #{height} tall."
  #   end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

p '###############################'

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.

####################

p '#########################'

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

p 'XXX'
MyCar.gas_mileage(13, 351)

p '----'
my_car = MyCar.new('2010', 'Ford Focus', 'silver')
puts my_car # => My car is a silver, 2010, Ford Focus.

p 'XXX'

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed

p '#################################'

lumina.color = 'black'
puts lumina.color
puts lumina.year

p '###################'

class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs   # => 0

dog1 = GoodDog.new

puts GoodDog.total_number_of_dogs   # => 1

dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs   # => 2

# ########################

p '########'

class GoodDog2
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name   = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end

  def what_is_self
    self
  end

  puts self
end

sparky2 = GoodDog2.new('SparkyC', '12c inches', '10c lbs')
p sparky2.what_is_self
# => #<GoodDog:0x007f83ac062b38 @name="Sparky", @height="12 inches", @weight="10 lbs">

sparky2.change_info('Spartacusx', '24x inches', '45x lbs')
puts sparky2.info # => Spartacus weighs 45 lbs and is 24 inches tall.

p 'Inheritance'
p '###'

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    'Hello!'
  end
end

class GoodDog1 < Animal
  def initialize(color)
    super
    @color = color
  end

  def speak
    super + ' from GoodDog class'
  end
end

# sparky = GoodDog1.new
# p sparky.speak        # => "Hello! from GoodDog class"

bruno = GoodDog1.new('brown')
p bruno

p '##########'

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

p BadDog.new(2, 'bear') # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">

p '##############'

class Animal2
  def initialize; end
end

class Bear < Animal2
  def initialize(color)
    super()
    @color = color
  end
end

bear = Bear.new('black') # => #<Bear:0x007fb40b1e6718 @color="black">
p bear

####################

p 'Private, Protected, and Public'

class Person
  def initialize(age)
    @age = age
  end

  def older?(other_person)
    age > other_person.age
  end

  protected

  attr_reader :age
end

malory = Person.new(64)
sterling = Person.new(42)

malory.older?(sterling)  # => true
sterling.older?(malory)  # => false

# malory.age
# => NoMethodError: protected method `age' called for #<Person: @age=64>

#######################

p 'Accidental Method Overriding'


# class Parent
#     def say_hi
#       p "Hi from Parent."
#     end
#   end
  
#   Parent.superclass       # => Object

# class Child
#     def say_hi
#       p 'Hi from Child.'
#     end
  
#     def send
#       p 'send from Child...'
#     end
#   end
  
#   lad = Child.new
#   lad.send :say_hi
  