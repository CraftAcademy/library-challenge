require './lib/library.rb'
class User 
  attr_accessor :name, :account_status, :library, :account_nr

  def initialize(attr={})
    set_name(attr[:name])
    @library = Library.new
    @book = nil
    @account_nr = attr[:account_nr]
    @account_status = attr[:account_status]
  end

  def search_book(search_word)
    @book = @library.search(search_word)
  end

  def check_out_book(search_word)
    if (account_nr.to_s.length == 6 || account_nr == nil) && account_status == :active
      @book = @library.check_out(search_word, @account_nr)
      receipt
    else 
      'You do not have a valid account' 
    end
  end

  def check_in_book(book_name)
    @book = @library.check_in(book_name)
    (@book[:available] == true && @book[:return_date].nil?) ? "Book is checked in" : "Check in book failed"
  end

  def receipt
    {account: @account_nr, title: @book[:item][:title], return_date: @book[:return_date]}
  end

  def deactivate
    @account_status = :disabled
  end

  def user_list
    book_list = []
    books = @library.user_booklist(@account_nr)
    books.each do |book| 
    book_list << {title: book[:item][:title], author: book[:item][:author], return_date: book[:return_date]}
    end
    book_list
  end

  private

  def set_name(obj)
    obj == nil ? missing_name : @name = obj
  end

  def missing_name
    raise "A name is required"
  end

end
