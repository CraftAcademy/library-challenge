require 'yaml'

class Library
  attr_accessor :data

  def initialize
    @data = load_data
  end

  def list_all_books
    books = []
    (0...data.length).each do |book|
      books << "#{@data[book][:item][:author]} : #{@data[book][:item][:title]} : #{@data[book][:available]}"
    end
    return books.sort
  end

  def find_available_books
    available_books = []

    (0...data.length).each do |book|
      if data[book][:available] == true
        available_books << "#{data[book][:item][:title]} : #{data[book][:item][:author]}"
      end
    end
    return available_books
  end

  def calculate_return_date
    String(Date.today + 30)
  end

  def write_changes
    File.open('./lib/data.yml', 'w') {|book| book.write data.to_yaml}
  end

  private
  def load_data
    YAML.load_file('lib/data.yml')
  end

end