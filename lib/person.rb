require 'date'

class Person

  attr_accessor :available_books, :shelf, :library_account
  def initialize
    @shelf = YAML.load_file('./books/data.yml')
    @available_books = @shelf.select { |obj| obj[:available]}
  end

  def available
    if @available_books
      'Book is available for borrowing'
    else
      'Book is not available for borrowing'
    end
  end

  def person_shelf
    if @shelf[0][:available] = true && @shelf[0][:return_date] == nil
      'Nobody has borrowed BoAlfons och soldatpappanok'
    elsif @shelf[1][:available] = true && @shelf[0][:return_date] == nil
      'Nobody has borrowed Skratta lagom! Sa pappa Åberg'
    elsif @shelf[2][:available] = true && @shelf[0][:return_date] == nil
      'Nobody has borrowed Osynligt med Alfons'
    elsif @shelf[3][:available] = true && @shelf[0][:return_date] == nil
      'Nobody has borrowed Pippi Långstrump'
    elsif @shelf[4][:available] = true && @shelf[0][:return_date] == nil
      'Nobody has borrowed Pippi Långstrump går ombord'
    else
      'Person has book in possession'
    end
  end

  def return_date
    date = Date.today
    if date = (date + 30).to_s
      'Book is due to be returned today'
    elsif date > (date + 30).to_s
      'Book return is overdue'
    else
      'Book can still be used by person'
    end
  end
end
