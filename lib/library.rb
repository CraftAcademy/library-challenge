require 'yaml'

class Library
  STANDARD_VALIDITY_DAYS = 30
  attr_accessor :exp_date, :librarian#, :choice

  def initialize(attrs = {})
    @exp_date = set_return_date
    #@choice = choice
    #@librarian = call_librarian(attrs[:librarian])
  end

  def collection
    YAML.load_file('./lib/data.yml')
  end

  def set_return_date
    Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('Any books have to be returned by: %d/%m/%y')
  end

  def search(title)
    collection.select { |books| books[:item][:title].include? title }
  end

  def pick(choice)
    collection.detect { |book| book[:item][:title] == choice }
  end

  def final_choice(book)
    collection.detect { |book| book[:item][:title] == book }
    collection.index {|choice| choice[:item][:title] == book }
    #Returns the index of the chosen book
  end



  # def call_librarian(obj)
  #   obj == nil ? missing_librarian : obj
  # end

  # def missing_librarian
  #   raise 'No librarian here.'
  # end

end