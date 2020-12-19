class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'woof!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "Can't swim!"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

pete.run                # => "running!"
# pete.speak              # => NoMethodError

kitty.run               # => "running!"
kitty.speak             # => "meow!"
# kitty.fetch             # => NoMethodError

dave.speak              # => "bark!"

bud.run                 # => "running!"
bud.swim                # => "can't swim!"
