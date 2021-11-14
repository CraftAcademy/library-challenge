class Visitor
  attr_accessor :name

  def initialize(args = {})
    @name = set_name(args[:name])
  end

  private

  def missing_name
    raise "A name is required"
  end

  def set_name(name)
    name.nil? ? missing_name : name
  end
end
