class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{self.first_name} #{self.last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def name_compare(other_person)
    self.name == other_person.name
  end
  private

  def to_s
    name
  end

  def parse_full_name(full_name)
  parts = full_name.split
  self.first_name = parts.first
  self.last_name = parts.size > 1 ? parts.last : ''
  end

end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob.name_compare(rob)

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"