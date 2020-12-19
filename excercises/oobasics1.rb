# Update the following code so that, instead of printing the values, each
# statement prints the name of the class to which it belongs.

puts "Hello".class
puts 5.class
puts [1, 2, 3].class

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  attr_accessor :name
  include Walkable

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{self.name}!"
  end
end

kitty = Cat.new("Sophie")
kitty.greet
kitty.name = "Luna"
kitty.greet
kitty.walk