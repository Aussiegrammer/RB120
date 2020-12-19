# We create an object by defining a class and instantiating it by using the
# .new method to create an instance, also known as an object.

class MyClass
end

my_obj = MyClass.new

# A module allows us to group reusable code into one place.
# We use modules in our classes by using the include method invocation,
# followed by the module name. Modules are also used as a namespace.

module Study
end

class MyClass
  include Study
end

my_obj = MyClass.new


class MyCar
  attr_reader :year
  attr_accessor :colour

  def initialize(year, colour, model)
    @year = year
    @colour = colour
    @model = model
    @speed = 0
  end

  def speedup
    @speed += 10
  end

  def brake
    @speed -= 10
  end

  def turnoff
    @speed = 0
  end

  def spray_paint=(colour)
    puts "You spray paint the car #{colour}"
    self.colour = colour
  end
end

my_car = MyCar.new(1999, 'silver', 'Honda Civic')

my_car.speedup
my_car.speedup
my_car.speedup
puts my_car.year
puts my_car.colour
my_car.spray_paint = "Green"
puts my_car.colour

class MyCar2

  def self.gas_mileage(gas, miles)
    puts "#{miles / gas} miles per gallon of gas"
  end

  def to_s
    "This is a car."
  end
end

MyCar2.gas_mileage(13, 351)

car = MyCar2.new

puts car

# class Person
#   attr_accessor :name
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Steve")
# bob.name = "Bob"

module CarriesStuff
  def load_storage
    puts "You load a tonne of stuff to the vehicle"
  end
end

class Vehicle
  attr_accessor :colour
  attr_reader :year, :model
  @@number_of_cars = 0

  def initialize(year, colour, model)
    @@number_of_cars += 1
    @year = year
    @colour = colour
    @model = model
    @speed = 0
  end

  def self.how_many_cars?
    puts @@number_of_cars
  end

  def self.gas_mileage(gas, miles)
    puts "#{miles / gas} miles per gallon of gas"
  end

  def how_old?
    "The car is #{age} years old."
  end

  def speedup
    @speed += 10
  end

  def brake
    @speed -= 10
  end

  def turnoff
    @speed = 0
  end

  private

  def age
    current_year = Time.new.year
    current_year - @year
  end
end

class MyCar3 < Vehicle
  SIZE = "Small"
end

class MyTruck < Vehicle
  include CarriesStuff
  GECKOS = 100

end

car3 = MyCar3.new(1999, "Silver", "Honda")
truck = MyTruck.new(2000, "Silver", "Van")

Vehicle.how_many_cars?
truck.load_storage

puts Vehicle.ancestors
puts
puts MyCar3.ancestors
puts
puts MyTruck.ancestors

puts car3.how_old?

class Student
  attr_reader :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(name)
    self.grade > name.grade
  end

  protected
  attr_reader :grade
end

george = Student.new("George", 90)
bob = Student.new("Bob", 50)

p george
p bob
puts "Well done!" if george.better_grade_than?(bob)

class Person
  attr_writer :first_name, :last_name

  def full_name
    # omitted code
  end
end


class Student2
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end
  def self.change_grade(new_grade)
  grade = new_grade
  end
end

priya = Student2.new("Priya")
priya.change_grade('A')
priya.grade # => "A"