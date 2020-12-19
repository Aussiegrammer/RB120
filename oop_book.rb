# Initialize method is called when we call .new
# It is also referred to as a constructor

class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new


# @name is an instance variable. It exists as long as the object instance exists.
# The scope is outside of the method, larger, as part of the instance
# Instance variables track the 'state' of the object

class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")

class GoodDog
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def set_name=(name)
    @name = name
  end

  def speak
    "#{@name} says 'Arf!'"
  end
end


# All instance objects of the same class have access to the same behaviours
# States can be different, though

sparky = GoodDog.new("Sparky")
puts sparky.speak

fido = GoodDog.new("Fido")
puts fido.speak

# Sparky.name doesn't work, as you need a method to get an instance variable
# The below is a 'getter' method

puts sparky.get_name # => Sparky

# The below is a 'setter' method
# The method name is also set_name=, but due to Ruby Syntatical Sugar, we can do the below
sparky.set_name = "Spartacus"
puts sparky.get_name # => Spartacus

# As a convention, Rubyists prefer
# getters and setters to be the same as the variable name.
# As per below

class GoodDog
  def initialize(name)
    @name = name
  end

  def name                  # This was renamed from "get_name"
    @name
  end

  def name=(n)              # This was renamed from "set_name="
    @name = n
  end

  def speak
    "#{@name} says arf!"
  end
end

# Ruby has a built in way to create these getter and setter methods
# attr_accessor method
# Much cleaner!

class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name            # => "Sparky"
sparky.name = "Spartacus"
puts sparky.name            # => "Spartacus"

# attr_reader creates getter only
# attr_writer creates setter only
# Multiple symbols can use the below syntax
# attr_accessor :name, :height, :weight


# Class variables are accessible through instance methods and keep information about the class
# And not one instance of the class


class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end
  # Class methods are used against information of the class and not the instance
  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs


class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
  # Calling puts on the object calls the to_s method on the argument.
  # You can replace to_s like so.
  def to_s
    "The dog's name is #{self.name}"
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age

puts sparky