require 'yaml'

class Library
  STANDARD_VALIDITY_DAYS = 30
  attr_accessor :exp_date, :librarian

  def initialize(attrs = {})
    @exp_date = set_return_date
    @librarian = call_librarian(attrs[:librarian])
  end

  def collection
    YAML.load_file('./lib/data.yml')
  end

  def set_return_date
    Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('Any books have to be returned by: %d/%m/%y')
  end

  def search(title)
    collection.select { |obj| obj[:item][:title].include? title  }
  end

  def call_librarian(obj)
    obj == nil ? missing_librarian : obj
  end

  def missing_librarian
    raise 'No librarian here.'
  end

end