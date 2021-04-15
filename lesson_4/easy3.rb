# Question 1
# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:
# case 1:

hello = Hello.new
hello.hi # => "Hello" - Invokes the 'hi' method which invokes 'greet' with an argument of "Hello"

# case 2:

hello = Hello.new
# hello.bye # => NoMethodError - the 'bye' method is a part of the 'Goodbye' class, which is not in the lookup path

# case 3:

hello = Hello.new
# hello.greet # => ArgumentError - Greet method requires 1 argumenet

# case 4:
hello = Hello.new
hello.greet("Goodbye") # => "Goodbye" - Greet method within greeting class outputs the argument

# case 5:
# Hello.hi # => NoMethodError - No class methods which is being attempted to call

# Question 2
# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

# A: Define a class method for Hello, using def self.hi

# Question 3
# When objects are created they are a separate realization of a particular class.
# Given the class below, how do we create two different instances of this class with
# separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# A: Using constructor values

eva = AngryCat.new(3, 'Eva')
autumn = AngryCat.new(7, 'Autumn')
p eva
p autumn

# Question 4
# Given the class below, if we created a new instance of the class and then
# called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat"
  end
end

# How could we go about changing the to_s output on this method to look like this:
# I am a tabby cat? (this is assuming that "tabby" is the type we passed in during initialization).

# A: We would define a to_s method to do so, as done above. Due to the method lookup hierarchy
# It will use the to_s we define in the class first.

# Question 5
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
# tv.manufacturer # => NoMethodError - there is no instance method
tv.model # => Method works fine

Television.manufacturer # => Method works fine
# Television.model # => NoMethodError - there is no class method

# Question 6
# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# In the make_one_year_older method we have used self.
# What is another way we could write this method so we don't have to use the self prefix?

# A: @age would work as well

# Question 7
# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# A: The return line in the information definition. Ruby alwasy returns the last result of any
# method.



