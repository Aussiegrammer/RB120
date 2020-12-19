class Cat
  @@cat_total = 0
  attr_accessor :name, :colour

  def initialize(name, colour)
    @@cat_total += 1
    @name = name
    @colour = colour
  end

  def self.total
    puts "There are #{@@cat_total} cats"
  end

  def self.generic_greeting
    puts "Hello! I am a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{name} and I'm a #{colour} cat!"
  end

  def rename(new_name)
    self.name = new_name
  end

  def to_s
    "I'm #{name}!"
  end

  def identify
    self
  end

end

kitty = Cat.new('Autumn', 'tortie')
p kitty.name
kitty.rename('Chloe')
p kitty.name
p kitty.identify
Cat.generic_greeting
kitty.personal_greeting

# kitty2 = Cat.new("Autumn")
# kitty3 = Cat.new("Eva")

Cat.total
puts kitty
puts

# class Person
#   attr_writer :secret

#   def share_secret
#     puts "#{secret}"
#   end

#   private

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# person1.share_secret

class Person
  attr_writer :secret

  def compare_secret(other_person)
    secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)
