class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
puts bob.name                  # => 'bob'
bob.name = 'Robert'
puts bob.name                  # => 'Robert'


class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

puts

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

p bob = Person.new('Robert Smith')
p rob = Person.new('Robert Smith')

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"


module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end


class Cat
  include Walkable
  attr_accessor :name

  def initialize(name)
    @name = name
    greet
  end

  def greet
    puts "Hello! My name is #{name}!"
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.name = 'Luna'
kitty.greet
kitty.walk
Cat.generic_greeting
kitty.class.generic_greeting

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name
  end

end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name
puts

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify
puts

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{name}!"
  end

end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting


class Cat
  @@number_of_cats = 0

  def initialize
    @@number_of_cats += 1
  end

  def self.total
    puts @@number_of_cats
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total

class Cat
  COLOUR = 'purple'
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOUR} cat!"
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
puts kitty

class Person
  attr_accessor :secret

  def initialize
  end
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret

class Person
  attr_writer :secret

  def compare_secret(other_person)
    puts secret == other_person.secret
  end
  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)

module Towable
  def tow
    puts "I can tow a trailer!"
  end
end


class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def start_engine
    "Ready to go!"
  end
end


class Truck < Vehicle
  include Towable
  attr_reader :bed_type

  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end

  def start_engine(speed)
    super() + " " + "Drive #{speed} please!"
  end

end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type

car1 = Car.new(2006)
puts car1.year
puts truck1.start_engine('fast')

truck1.tow
puts Truck.ancestors