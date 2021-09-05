require './lib/library'
# require "yaml"
# require "date"

class Visitor
  attr_accessor :name, :list_of_books

  def initialize(name)
    #@list_of_books = nil
    @name = name
  end

  def database
    @list_of_books = YAML.load_file('./lib/base_data.yml')
  end

  def checkout_book(title, name)
    database

    if checkout_search(title)[:available] == false
      'Book unavailable.'
    else
      checkout_search(title)[:available] = false

      checkout_search(title)[:return_date] = Date.today.next_month.strftime('%d/%m/%y.').to_s

      checkout_search(title)[:checked_out_by] = name

      File.open('./lib/test_data.yml', 'w') { |f| f.write list_of_books.to_yaml }

      # return list_of_books.detect { |obj| obj[:book][:title].include? title }

      "Book checked out, please return #{Date.today.next_month.strftime('%d/%m/%y.')}"

    end
  end

  def list_available_books
    list_of_books.select { |obj| obj[:available] == true }
  end
end
