require 'yaml'

class Library
  attr_accessor :item, :available, :return_date

  def initialize
    @collection =  YAML.load_file('./lib/data.yml')
    @available = true
  end

  def show_books
    @available = @collection.select { |book| book[:available]  }
    @available.each do |book|
      puts "#{book[:item][:title]} written by #{book[:item][:author]} is available"
    end

    @unavailable = @collection.select { |book| book[:available] == false }
    @unavailable.each do |book|
      puts "#{book[:item][:title]} written by #{book[:item][:author]} is currently unavailable"
    end
  end
end
