class Visitor
  attr_accessor :name

  def initialize(attrs = {})
    set_name(attrs[:name])
  end

  def set_name(obj)
    obj.nil? ? missing_name : @name = obj
  end
end
