class Person

  attr_accessor :name

  def initialize(attrs = {})
    @name = username(attrs[:name])
  end

  def username(name)
    name == nil ? no_name : @name == name
  end

  def no_name
    raise 'You need an account to rent books'
  end

end
