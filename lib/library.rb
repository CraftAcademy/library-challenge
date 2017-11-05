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
      available_books << "#{item[:item][:title]} by #{item[:item][:author]}" if item[:available] == true
    end
    return available_books
  end

  def checkout(title, person)
    @collection.select do |obj|
      if expired_book?(person)
        return 'You have a book with an expired return date. Please return it first.'
      elsif obj[:available] == false
        return 'That book is already checked out'
      elsif obj[:item][:title].include? title
        person.books << { title: obj[:item][:title], author: obj[:item][:author], return_date: Date.today.next_month(1).strftime('%d/%m/%y') }
        update_collection(obj)
      end
    end
  end

  def return(title, person)
    person.books.detect do |obj|
      if obj[:title].include? title
        person.books.delete(obj)
      end
    end
  end

  private

  def expired_book?(person)
    person.books.detect do |book|
      return true if book[:return_date] < Date.today.strftime('%d/%m/%y')
    end
  end

  def update_collection(obj)
    obj[:available] = false
    obj[:return_date] = Date.today.next_month(1).strftime('%d/%m/%y')
    File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
  end
end
