 require 'yaml'
 require 'date'

class Library
  attr_reader :list, :title

  def initialize
    @list = YAML.load_file('./lib/data.yml')
  end

  def search_title(title)
    @list.select {|obj| obj[:item][:title] == title}
  end
  def search_author(author)
    @list.select {|obj| obj[:item][:author] == author}
  end

  def available_books
    @list.select { |obj| obj[:available] == true  }
  end

  def return_date
    Date.today.next_month.to_s
  end

  def lends_book(title)
    book = search_title(title)
    
   if book.first[:available] == true
    book.first[:return_date] = return_date
    book.first[:available] = false
    "This book is available and should be returned before #{book.first[:return_date]}"

    end
   end


end
