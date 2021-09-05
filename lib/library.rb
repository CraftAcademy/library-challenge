require 'yaml'
require 'date'

class Library
  attr_accessor :list_of_books

  def initialize
    @list_of_books = YAML.load_file('./lib/base_data.yml')
  end

  def search_for_title(title)
    list_of_books.select { |obj| obj[:book][:title].include? title }
  end

  def search_for_author(author)
    list_of_books.select { |obj| obj[:book][:author].include? author }
  end

  # def checkout_book(title, name)
  #   if checkout_search(title)[:available] == false
  #     'Book unavailable.'
  #   else
  #     checkout_search(title)[:available] = false

  #     checkout_search(title)[:return_date] = "#{Date.today.next_month.strftime('%d/%m/%y.')}"

  #     checkout_search(title)[:checked_out_by] = name

  #     File.open('./lib/test_data.yml', 'w') { |f| f.write list_of_books.to_yaml }

  #     #return list_of_books.detect { |obj| obj[:book][:title].include? title } 
      
  #     return "Book checked out, please return #{Date.today.next_month.strftime('%d/%m/%y.')}"

  #   end
  # end

  def return_book(title)
    checkout_search(title)[:available] = true
    checkout_search(title)[:checked_out_by] = nil

    checkout_search(title)[:return_date] = nil

    File.open('./lib/test_data.yml', 'w') { |f| f.write list_of_books.to_yaml }
    'Book returned.'
  end

  def list_available_books
    list_of_books.select { |obj| obj[:available] == true }
  end
end

# private

# def checkout_search(title)
#   list_of_books.detect { |obj| obj[:book][:title].include? title }
# end
