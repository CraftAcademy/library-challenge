require 'yaml'


class Visitor

  attr_accessor :books

  def initialize

    @books = YAML.load_file('./lib/data.yml')
  end

  def book_by_keywords
    books.detect { |obj| obj[:item][:title].include? "Slutet"  }

    
  end
end
  





