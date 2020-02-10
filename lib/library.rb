require 'yaml'

class Library

  attr_accessor :index

  STANDARD_RETURN_DATE = 1

  def initialize
    @index = YAML.load_file('./lib/data.yml')
  end

  def query_title(title)
      index.select { [:title].include? "#{title}" }
  end
  
  def query_author(author)
    index.select { [:author].include? "#{author}" }
  end

  def is_available(available)
    index.select { [:available] }
  end

=begin  WIP
    
Need to write to yaml faile

  # def checkout_book(num)
  #     @index[(num)][:available] = false
  #     @index[(num)][:return_date] = required_return_date
  #     File.open('./lib/data.yml', 'w') { |f| f.write @index.to_yaml }
  # end

  # def checkin_book(num)
  #   @index[(num)][:available] = true
  #   @index[(num)][:return_date] = nil
  #   File.open('./lib/data.yml', 'w') { |f| f.write @index.to_yaml }
  # end

Need to set add 1 month to checkout date

  def required_return_date
    Date.today.next_month(STANDARD_RETURN_DATE).strftime('%y-%m-%d')
  end

=end

end

# to see index in irb p @index = YAML.load_file('./lib/data.yml')



