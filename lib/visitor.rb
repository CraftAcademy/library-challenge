require "./lib/library.rb"

class Visitor
  attr_accessor :name

  def initialize(args = {})
    @name = set_name(args[:name])
  end

  def save_book_receipt(args = {})
    array = load_yml_file
    array.nil? ? array = [args] : array.push(args)
    write_to_yml_file(array)
  end

  def create_yml_file
    File.open("./#{@name}_data.yml", "w")
  end

  private

  def missing_name
    raise "A name is required"
  end

  def set_name(name)
    name.nil? ? missing_name : name
  end

  def load_yml_file
    YAML.load_file("./#{@name}_data.yml")
  end

  def write_to_yml_file(array)
    File.open("./#{@name}_data.yml", "w") { |file| file.write(array.to_yaml) }
  end
end
