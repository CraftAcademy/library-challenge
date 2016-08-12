require 'yaml'

class Library

  attr_accessor :jane_library, :exp_date

  def initialize
    @jane_library = YAML.load_file('./lib/data.yml')
    @exp_date = Date.today.next_month(1).strftime("%m/%y")
  end
  #attr_accessor :item, :title, :author, :published, :available, :return_date

  def lend(item, titel)
    case
    when book_is_not_available(available) then
          { available: false, message: 'Book is not in library' }
    when subject_have_library_book_at_home then
          { available: true, message: 'Return the book you have at home first' }
    else
        perform_lend(item, titel, available, return_date)
        { available: true, message: 'Return the book after 30 days' }
    end
  end

  private

  def set_expiry_date
    Date.today.next_month(30).strftime("%m/%y")
  end
end
