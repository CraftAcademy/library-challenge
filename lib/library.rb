require 'yaml'

class Library
  attr_accessor :item, :available, :return_date

  def initialize
    @collection =  YAML.load_file('./lib/data.yml')
  end

  def show_books
    @collection.each do |book|
      puts "#{book[:item][:title]} written by #{book[:item][:author]}"
    end
  end
end
