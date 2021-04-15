# Question 1
# Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

a = true
b = "hello"
c = [1, 2, 3, "happy days"]
d = 142

# A: All are objects.
p a.class
p b.class
p c.class
p d.class

# Question 2
# If we have a Car class and a Truck class and we want to be able to go_fast,
# how can we add the ability for them to go_fast using the module Speed?
# How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# A: 'include' the module Speed inside of the classes above.

blue_truck = Truck.new
blue_truck.go_fast

small_car = Car.new
small_car.go_fast

# Question 3
# In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class as shown below.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

# When we called the go_fast method from an instance of the Car class (as shown below)
# you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

# A: Using self.class we are getting the object itself's (self) class (.class) and intrepolating it into the string (#{})

# Question 4
# If we have a class AngryCat how do we create a new instance of this class?

# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# A:

eva = AngryCat.new
eva.hiss

# Question 5
# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# A: Class Pizza has an instance variable. Instance variables are indicated by the @ symbol. @name.
# #instance_variables can be called upon an object

hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")

p hot_pizza.instance_variables
p orange.instance_variables

# Question 6
# What could we add to the class below to access the instance variable @volume?

class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end

  def get_volume
    @volume
  end
end

# A 'getter' method, or a method that retreives it. Below are examples. You can also access it with #instance_variuable_get, but this isn't recommended.

big_cube = Cube.new(5000)
p big_cube.instance_variable_get("@volume")
p big_cube.volume
p big_cube.get_volume

# Question 7
# What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

# A: Under the ruby documentation, 'Object'. Alternatively, IRB / test yourself.  https://docs.ruby-lang.org/en/master/Object.html



# Question 8
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

# You can see in the make_one_year_older method we have used self. What does self refer to here?

# A: self refers to the instance of the object calling it.

eva = Cat.new('hybrid')
autumn = Cat.new('tortie')
3.times { eva.make_one_year_older }
7.times { autumn.make_one_year_older }

p eva.age
p autumn.age

# Question 9
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

# In the name of the cats_count method we have used self. What does self refer to in this context?
# A: self in this context is referring to the class itself - Cat.

# Question 10
# If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# A:
my_bag = Bag.new('green', 'cloth')
p my_bag