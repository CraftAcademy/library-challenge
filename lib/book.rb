require 'yaml'

class Book
  STANDARD_VALIDITY_DAYS = 30
  attr_accessor :exp_date

  def initialize(attrs = {})
    @exp_date = set_return_date
  end

  def collection
    YAML.load_file('./lib/data.yml')
  end

  def set_return_date
    Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('%d/%m/%y')
  end

  def search(title)
    collection.select { |obj| obj[:item][:title].include? title  }
  end
  # def search(book, person)
    
  # end


end