# oop-ruby

## OBJECT-ORIENTED PROGRAMMING

[Cheatsheet](https://www.codecademy.com/learn/learn-ruby/modules/learn-ruby-object-oriented-programming-part-i-u/cheatsheet)

Table of Contents
===

* [Scope it Out](#scope-it-out)
* [Ruby Class Variables](#ruby-class-variables)
* [Ruby .new Method](#ruby-new-method)
* [Ruby Instance Variable](#ruby-instance-variable)
* [Ruby initialize Method](#ruby-initialize-method)
* [Ruby Class](#ruby-class)
* [Ruby super Keyword](#ruby-super-keyword)
* [Inheritance](#inheritance)
    * [Inheritance Syntax](#inheritance-syntax)
    * [Inheritance vs Modules](#inheritance-vs-modules)
* [Ruby attr_reader attr_writer Methods](#ruby-attrreader-attrwriter-methods)
* [Ruby namespace](#ruby-namespace)
* [Ruby require Keyword](#ruby-require-keyword)
* [Ruby Module](#ruby-module)
* [Ruby attr_accessor Method](#ruby-attraccessor-method)
* [Self](#self)

Scope it Out
---

Some variables start with `$`, `@`, or `@@`. This helps mark them as `global`, `instance`, and `class variables` respectively

Ruby Class Variables
---

In Ruby, `class variables` are attached to the class in which they are declared. A class variable should be declared with two `@` symbols preceding it.

```ruby
class Child
  @@children = 0
  def initialize(name, birth_year)
    @name = name
    @birth_year = birth_year
    @@children +=1
  end

  def self.children_added
    return @@children
  end

end

naomi = Child.new("Naomi", 2006)
bertha = Child.new("Bertha", 2008)

puts Child.children_added # => 2
```

Ruby .new Method
---

In Ruby, a new class instance can be created by calling the `.new` method of the class. Arguments to the class’ `initialize` method can be passed in to the `.new` call.

```ruby
class Fighter
  def initialize(name, style, division, age)
    @name = name
    @style = style
    @division = division
    @age = age
  end
end

conor = Fighter.new("Conor", "mixed martial arts", "Welterweight", 31)
```

Ruby Instance Variable
---

In Ruby, the `@` symbol is used to signify an `instance variable.` Instance variables hold a value specific to each instance of that class, not to all members of the class itself.

```ruby
class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
end

# In this example, name and grade are the instance variables.
```

Ruby initialize Method
---

In a Ruby class, an `initialize` method is used to generate new instances of the class. It is usually the first method of a class.

```ruby
class Person
  def initialize
    # this code runs when a new instance is created
  end
end

#Every time Person.new is called, the initialize method of the Person class is called.
```

Ruby Class
---

A Ruby `class` is used to organize and model objects with similar attributes and methods.

```ruby
class NewClass
  # code for this class 
end


# A basic class definition consists of the class keyword, the name of the class in CamelCase (with the first letter capitalized) format, and an end keyword.
```

Ruby super Keyword
---

Ruby’s built-in `super` keyword is used to directly access the attributes or methods of a superclass. This means a class with `super` will inherit the attributes or methods of a superclass.

```ruby
class Trip
  def initialize(duration, price)
    @duration = duration
    @price = price
  end
end


class Cruise < Trip
  def initialize(duration, price)
    super
  end
end

spain_backpacking = Trip.new(14, 800.00)
carnival = Cruise.new(7, 2400.00)

#In this example, the Cruise class inherits from the Trip class and all of its attributes, including duration and price, are carried over with the super keyword.

class DerivedClass < Base
  def some_method
    super(optional args)
      # Some stuff
    end
  end
end

```

When you call `super` from inside a method, that tells Ruby to look in the superclass of the current class and find a method with the same name as the one from which `super` is called. If it finds it, Ruby will use the superclass’ version of the method.

Inheritance
---

```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak        # => "Hello! from GoodDog class"
```

### Inheritance Syntax

In Ruby, inheritance works like this:

```ruby
class DerivedClass < BaseClass
  # Some stuff!
end
```

### Inheritance vs Modules

When to use class inheritance vs mixins modules

1. You can only subclass (class inheritance) from one class. You can mix in as many modules (interface inheritance) as you'd like.
1. If there's an "is-a" relationship, class inheritance is usually the correct choice. If there's a "has-a" relationship, interface inheritance is generally a better choice. For example, a dog "is an" animal and it "has an" ability to swim.
1. You cannot instantiate modules (i.e., no object can be created from a module). Modules are used only for namespacing and grouping common methods together.

Ruby attr_reader attr_writer Methods
---

In Ruby, `attr_reader` and `attr_writer` are methods used to read and write variables, respectively.

```ruby
class Student
  attr_reader :name
  attr_writer :name
  def initialize(name)
    @name = name
  end
end
#In this example, Ruby is able to both read and write the @name instance variable since it was passed to attr_reader and attr_writer as a symbol.

top_student = Student.new("Jyothi")
puts top_student.name # => Jyothi
#In classes with attr_reader, instance variables can be accessed using . notation

puts top_student.name # => Jyothi
top_student.name = "Anika"
puts top_student.name # => Anika
#In classes with attr_writer, instance variables can be reassigned using . notation
```

Ruby namespace
---

In Ruby, the term `namespace` refers to a module the contains a group of related objects. An example of a Ruby namespace is the `Math` module.

```ruby
#To retrieve a constant from the Math module, the scope resolution operator (::), should be used.

puts Math::PI
# => 3.141592653589793

#In this example, Ruby is targetting the PI constant from the Math module using the scope resolution operator, (::), and printing its value to the console.
```

Ruby require Keyword
---

In Ruby, the `require` keyword is used to fetch a certain module which isn’t yet presented in the interpreter. It is best practice to place this at the beginning of your code.

```ruby
require 'date'

puts Date.today
# => 2020-04-16
```

Ruby Module
---

In Ruby, a `module` contains a set of methods, constants, or classes which can be accessed with the `.` operator similarly to classes . Unlike classes, it is impossible to create instances of a Ruby module.

Like class names, module names are written in CapitalizedCamelCase, rather than lowercase_with_underscores.

```ruby
#A Ruby module can be created using the module keyword followed by the module name written in CapitalizedCamelCase format finalized with an end.

module MyPizza
  # Bits 'n pieces
  FAVE_TOPPING = "Buffalo Chicken"
end
#In this example, myPizza is a module that holds a constant, FAVE_TOPPING, set equal to the string, Buffalo Chicken.

module Circle

  PI = 3.141592653589793
  
  def Circle.area(radius)
    PI * radius**2
  end
  
  def Circle.circumference(radius)
    2 * PI * radius
  end
end

```

Imitating Multiple Inheritance: The Marriage of Modules and Classes

```ruby
module MartialArts
def swordsman
puts "I'm a swordsman."
end
end

class Ninja
include MartialArts
  def initialize(clan)
    @clan = clan
  end
end

class Samurai
include MartialArts
  def initialize(shogun)
    @shogun = shogun
  end
end
```

Ruby attr_accessor Method
---

In Ruby, `attr_accessor`, used to make a variable both readable and writeable, is a shortcut to `attr_reader` and `attr_writer`.

```ruby
class CollegeStudent
  attr_reader :dorm
  attr_accessor :major

  def initialize(dorm, major)
    @dorm = dorm
    @major = major
  end
end

#In this example, Ruby is able to only read the @dorm instance variable but both read and write the @major instance variable since it was passed to the attr_accessor method.
```

Self
---

1. Use `self` when calling setter methods from within the class. In our earlier example we showed that `self` was necessary in order for our change_info method to work properly. We had to use `self` to allow Ruby to disambiguate between initializing a local variable and calling a setter method.

1. Use `self` for class method definitions.

```ruby
class GoodDog
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


sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.I

```

To be clear, from within a class...

1. `self`, inside of an instance method, references the instance (object) that called the method - the calling object. Therefore, `self.weight=` is the same as `sparky.weight=`, in our example.

1. `self`, outside of an instance method, references the class and can be used to define class methods. Therefore if we were to define a `name` class method, `def self.name=(n)` is the same as `def GoodDog.name=(n)`.

Thus, we can see that `self` is a way of being explicit about what our program is referencing and what our intentions are as far as behavior. `self` changes depending on the scope it is used in, so pay attention to see if you're inside an instance method or not. `self` is a tricky concept to grasp in the beginning, but the more often you see its use, the more you will understand object oriented programming. If the explanations don't quite make sense, just memorize those two rules above for now.
