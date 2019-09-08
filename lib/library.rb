require 'yaml'

class Library
  STANDARD_VALIDITY_DAYS = 30
  attr_accessor :exp_date, :librarian

  def initialize(attrs = {})
    @exp_date = set_return_date
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

  def checkout(book)
    collection.detect { |book| book[:item][:title] == book }
    index = collection.index { |choice| choice[:item][:title] == book }
    collection[index][:available]
    #Responds to true or false
    if collection[index][:available] == true
        collection[index][:available] = false
        return thank_you
    else not_available
    end
  end

  def thank_you
    File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
    return 'You have checked out this book'
  end

  def not_available
    return 'This book is currently unavailable'
  end

  # def call_librarian(obj)
  #   obj == nil ? missing_librarian : obj
  # end

  # def missing_librarian
  #   raise 'No librarian here.'
  # end

end