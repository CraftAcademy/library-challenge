require 'yaml'
require 'date'
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

  def checkout(title, person)
    @collection.select do |obj|
      if obj[:item][:title].include? title
        person.books << { title: obj[:item][:title], author: obj[:item][:author], return_date: Date.today.next_month(1).strftime('%d/%m/%y') }
        obj[:available] = false
        obj[:return_date] = Date.today.next_month(1).strftime('%d/%m/%y')
        update_collection
      end

    end
  end

  private

  def update_collection
    File.open('./data.yml', 'w') { |f| f.write collection.to_yaml }
  end
end
