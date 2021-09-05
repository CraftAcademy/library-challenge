require "./lib/library"
# require "yaml"
# require "date"

class Visitor
  attr_accessor :name, :list_of_books

  def initialize(name)
    @list_of_books = YAML.load_file('./lib/base_data.yml')
    @name = name
  end


  def list_available_books
    list_of_books.select { |obj| obj[:available] == true }
  end


end

