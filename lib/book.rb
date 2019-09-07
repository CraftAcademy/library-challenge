require 'yaml'

class Book
  STANDARD_VALIDITY_MONTHS = 1
  attr_accessor :collection, :exp_date

  def initialize(attrs = {})
    @exp_date = set_return_date
    @collection = YAML.load_file('./lib/data.yml')
  end

  def set_return_date
    Date.today.next_month(STANDARD_VALIDITY_MONTHS).strftime('%d/%m/%y')
  end

  def search(book, person)
    
  end


end