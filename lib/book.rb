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
    Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('Any books have to be returned by: %d/%m/%y')
  end

  def search(title)
    collection.select { |obj| obj[:item][:title].include? title  }
  end

  # def checkout

  # end

  # File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }

  # collection[0][:available] = false

end