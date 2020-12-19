# Correct the following program so it will work properly.
# Assume that the Customer and Employee classes have complete implementations;
# just make the smallest
# possible change to ensure that objects of both types have access to the print_address method.

module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable # Mixin Module
  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new
bob = Employee.new
betty.print_address
bob.print_address
puts

# Correct the following program so it will work properly.
# Assume that the Car class has a complete implementation;
# just make the smallest possible change to ensure that cars have access to the drive method.

module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
puts


# Modify the House class so that the program will work.
# You are permitted to define only one new method in House.


class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)

puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1
puts

# Home 1 is cheaper
# Home 2 is more expensive

# Write a class that will display:
# ABC
# xyz
class Transform
  def initialize(str)
    @str = str
  end

  def uppercase
    @str.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')


# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end
puts

thing = Something.new
puts Something.dupdata
puts thing.dupdata
puts

# Modify this code so it works.
# Do not make the amount in the wallet accessible to any method that isn't part of the Wallet class.


class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected
  attr_reader :amount

end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end
puts

# Write the classes and methods that will be necessary to make this code run,
# and print the following output:

class Shelter

  def initialize
    @adoptors = []
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    unless @adoptors.include?(owner)
      @adoptors << owner
    end
  end

  def print_adoptions
    @adoptors.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.print_pets
    end
  end

  private

  attr_accessor :adoptors

end

class Owner
  attr_reader :name, :pets, :number_of_pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
    @pets = []
  end

  def add_pet(pet)
    @number_of_pets += 1
    @pets << pet
  end

  def print_pets
    @pets.each do |pet|
      puts "a #{pet.type} named #{pet.name}"
    end
  end
end

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# What is wrong with the following code? What fix(es) would you make?

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander
puts

# You have the following classes:

module Walkable
  def walk
    puts "#{name} #{gait} forward."
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def name
    "#{@title} #{@name}"
  end

  private

  def gait
    "struts"
  end
end


# You need to modify the code so that this works:
# You are only allowed to write one new method to do this.

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"