require 'yaml'
class Library
  attr_accessor :collection
  def initialize
    @collection = YAML.load_file('./lib/data.yml')
  end

  def booklist
    available_books = []
    @collection.each do |item|
      available_books << "#{item[:item][:title]} av #{item[:item][:author]}" if item[:available] == true
    end
    return available_books
  end
end
