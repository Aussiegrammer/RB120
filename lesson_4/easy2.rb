# Question 1
# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

# A: "You will eat a lunch / take a nap soon / stay at work late" It will choose
# one of three choices in the array chosen randomly.

# Question 2
# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

# A: Due to hierarchy, it will access the choices within the RoadTrip class randomly
# first, over the Oracle class.

# Question 3
# How do you find where Ruby will look for a method when that method is called?
# How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for Orange and HotSauce?

# A: You can call #ancestors against a class and it will show the ancestors and method
# lookup chain of an object
# [Orange, Taste, Object, Kernel, BasicObject]
# [HotSauce, Taste, Object, Kernel, BasicObject]

# Question 4
# What could you add to this class to simplify it and remove two methods
# from the class definition while still maintaining the same functionality?

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

# Add attr_accessor which is ruby shorthand for creating the getter and setter
# methods
# attr_accessor :type

# Question 5
# There are a number of variables listed below.
# What are the different types and how do you know which is which?

excited_dog = "excited dog" # - Local Variable, no prefix
@excited_dog = "excited dog" # - Instance Variable, indicated by the @ symbol
# @@excited_dog = "excited dog" # - Class Variable, indicated by the @@ symbols

# Question 6
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know?
# How would you call a class method?

# A: Class methods are indicated when defining them and calling the class object with self
# before definition. - def self.manufacturer

Television.manufacturer

# Question 7
# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works.
# What code would you need to write to test your theory?

# A: The class variable @@cats_count is instantiated by the class itself, and then increments
# by one per object created of the Cat class through the initialize method.
# We can test this by creating a couple of Cat objects and running the class method
# self.cats_count

eva = Cat.new('cat')
autumn = Cat.new('cat')
p Cat.cats_count

# Question 8
# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

# And another class:

# class Bingo
#   def rules_of_play
#     #rules of play
#   end
# end

# What can we add to the Bingo class to allow it to inherit the play method from the Game class?

# A: Have Bingo inheret the Game class.

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

game = Bingo.new
p game.play

# Question 9
# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class,
# keeping in mind that there is already a method of this name in the Game class
# that the Bingo class inherits from.

# A: Due to the method lookup path, invoking the play method against an object of the
# Bingo class will invoke that method, opposed to the one in Game.


# Question 10
# What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.

# A:
# 1. Namespacing and grouping objects
# 2. DRY, Don't repeat yourself in code
# 3. Organisation of code to limit ripple effects and problems when codebases get large
# 4. Building applications faster with pre-written code
# 5. It allows for a level of abstraction