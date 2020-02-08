require 'yaml'

class Library

  attr_accessor :index

  #STANDARD_RETURN_DATE = 30

  def initialize
    @index = YAML.load_file('./lib/data.yml')
  end

  def query_title(title)
      index.select { [:item][:title].include? "#{title}" }
  end
  
  def query_author(author)
    index.select { [:item][:author].include? "#{author}" }
  end

 # def return_date
  #  Date.today.next_year(Account::STANDARD_VAILIDITY_YRS).strftime('%m/%y')
  #end

end

# to see index in irb p @index = YAML.load_file('./lib/data.yml')



