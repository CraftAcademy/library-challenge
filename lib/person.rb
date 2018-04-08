
class Person

  attr_accessor :name

  def initialize(attrs = {})
    if attrs[:name] == nil
      raise 'please enter name'
    end

    @name = attrs[:name]


  end
end
