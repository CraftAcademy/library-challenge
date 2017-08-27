require 'date'

class Library
  STANDARD_VALIDITY_MONTHS = 1

  attr_accessor :collection, :exp_date, :shelf

  def initialize
    @collection = YAML.load_file('./books/data.yml')
    @exp_date = Date.today.next_month(STANDARD_VALIDITY_MONTHS).strftime('%d/%m')
  end

  def checkout
    if collection.select { |obj| obj[:available]}
      'Book is available for checkout'

    else
      'Book is not available for checkout'
    end
  end

  def remaining_books
    if collection[0][:available] = false
      'Alfons och soldatpappan is not availble for borrowing'
    elsif collection[1][:available] = false
      'Skratta lagom! Sa pappa Åberg is not availble for borrowing'
    elsif collection[2][:available] = false
      'Osynligt med Alfons is not availble for borrowing'
    elsif collection[3][:available] = false
      'Pippi Långstrump is not availble for borrowing'
    elsif collection[4][:available] = false
      'Pippi Långstrump går ombord is not availble for borrowing'
    else
      'All the books have been borrowed'
    end
  end
end
