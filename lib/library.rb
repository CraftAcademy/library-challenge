require 'yaml'

class Library
  STANDARD_VALIDITY_DAYS = 30
  attr_accessor :exp_date#, :librarian

  def initialize(attrs = {})
    @exp_date = set_return_date
  end

  def collection
    YAML.load_file('./lib/data.yml')
  end

  def set_return_date
    Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('Any books have to be returned by: %d/%m/%y')
  end

  def search(title)
    collection.select{ |books| books[:item][:title].include? title }
  end

  def pick(choice)
    collection.detect{ |book| book[:item][:title] == choice }
  end

  def checkout(book)
    collection.detect{ |book| book[:item][:title] == book }
    index = collection.index { |choice| choice[:item][:title] == book }
    if collection[index][:available] == true
       collection[index][:available] = false
       File.open('./lib/data.yml', 'w') { |file| file.write collection.to_yaml }
       return 'You have checked out this book ' + @exp_date
    else not_available
    end
  end

  def not_available
    return 'This book is currently unavailable'
  end

end