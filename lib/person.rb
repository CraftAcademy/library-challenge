#require 'library.rb'
require 'yaml'
require 'date'

class Person

attr_accessor :bookshelf

  def initialize
    @bookshelf = []
  end

  def checkout(book)
    library = YAML::load_file(File.join(__dir__, 'data.yml'))
    my_choice = library.select { |obj| obj[:item][:title].include? book }
    #binding.pry
    my_choice[0][:available] = false
    my_choice[0][:return_date] = Date.today >> 1
    @bookshelf << my_choice

    library.each do |items|

      if items[:item][:title] == my_choice[0][:item][:title]
      #binding.pry
        items[:available] = false
        items[:return_date] = Date.today >> 1

      else
      end

    end

    File.open('./lib/data.yml', 'w') { |f| f.write library.to_yaml }
    my_choice[0][:item][:title]
  end

  def clear_bookshelf
    @bookshelf = []
  end

end
