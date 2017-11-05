class Person

  attr_accessor :name

  def initialize(attrs = {})
    @name = username(attrs[:name])
  end

  def username(name)
    @name = name
    #name == nil ? no_account : @name = name
  end
end
