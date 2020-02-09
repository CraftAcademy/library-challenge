require 'yaml'

class Library

  attr_accessor :index

  STANDARD_RETURN_DATE = 1

  def initialize
    @index = YAML.load_file('./lib/data.yml')
  end

  def query_title(title)
      index.select { [:item][:title].include? "#{title}" }
  end
  
  def query_author(author)
    index.select { [:item][:author].include? "#{author}" }
  end

  #def is_available(available)
  #  index.select { [:item][:available].equal? true }
  #end

  def return_date
    Date.today.next_month(STANDARD_RETURN_DATE).strftime('%y-%m-%d')
  end

end

# to see index in irb p @index = YAML.load_file('./lib/data.yml')



