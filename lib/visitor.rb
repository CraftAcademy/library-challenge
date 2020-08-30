require 'yaml'

require 'yaml'

class Visitor

  attr_accessor :books

  def initialize

    @books = YAML.load_file('./lib/data.yml')
  end

  def book_by_keywords
    books.detect { |obj| obj[:item][:title].include? "Slutet"  }
  end

  def checkout_a_book
    books = YAML.load_file('./lib/data.yml')
    books[0][:available] = false
    books[0][:return_date] = Date.today.next_day(30).strftime('%d/%m')
    File.open('./lib/data.yml', 'w') { |f| f.write books.to_yaml}
    books[0]
  end

  def checkin_a_book
    books = YAML.load_file('./lib/data.yml')
    books[0][:available] = true
    books[0][:return_date] = nil
    File.open('./lib/data.yml', 'w') { |f| f.write books.to_yaml }
    books[0]
end

end
  





