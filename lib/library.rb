require 'yaml'

class Library
  attr_accessor :database

  def initialize
    @database = load_database
  end

  def list_all_books
    books = []
    (0...data.length).each do |book|
      books.push "#{@database[book][:item][:author]}: #{@database[book][:item]}, Available: #{@database[book][:available]}"
    end
    books.sort!
    boock.each {|book| puts book}
  end

  private
  def load_database
    YAML.load_file('lib/data.yml')
  end
end