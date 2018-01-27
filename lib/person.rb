require './lib/library'

class Person

attr_accessor :bookshelf

  def initialize
    @bookshelf = []
  end

  def checkout(book)
    library = YAML::load_file(File.join(__dir__, 'data.yml'))
    my_choice = library.select { |obj| obj[:item][:title].include? book  }
    @bookshelf << my_choice
  end

end
#library = YAML::load_file(File.join(__dir__, 'data.yml'))
#my_choice = library.select { |obj| obj[:item][:title].include? 'Alfons och soldatpappan'  }
#@bookshelf.push(my_choice)
#puts @bookshelf.class
