require './lib/library.rb'
require 'date'

class User
  attr_accessor :account

  def initialize
    @account = []
    @library = Library.new
  end

  def find_available_books
    @library.find_available_books
  end

  def search_for_book_title(search_str)
    search_results = []
    search = @library.data.select { |book| book[:item][:title].include? search_str}
    search.each { |book| search_results << "#{book[:item][:title]} : #{book[:item][:author]}" }
    return search_results
  end

  def search_for_book_author(search_str)
    search_results = []
    search = @library.data.select { |book| book[:item][:author].include? search_str}
    search.each { |book| search_results << "#{book[:item][:author]} : #{book[:item][:title]}" }
    return search_results
  end

  def checkout(title, author)
    data = @library.data
    (0...data.length).each do |book|
      transaction_success = false
      if (data[book][:item][:author] == author) && (data[book][:item][:title] == title)
        if data[book][:available] == true
          data[book][:available] = false
          data[book][:return_date] = @library.calculate_return_date
          transaction_success = true
          write_to_account(data[book][:item][:title], data[book][:item][:author], data[book][:return_date])
        end
      end
      @library.write_changes
      return transaction_success
    end
    
  end

  def display_account
    return_strings = []
    (0...account.length).each do |book| 
      return_strings << "#{account[book][:title]} : #{account[book][:author]} : #{account[book][:return_date]}"
    end
    return return_strings
  end

  private

  def write_to_account(book_title, book_author, date)
    account << {title: book_title, author: book_author, return_date: date}
  end

end