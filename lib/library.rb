require 'yaml'

class Library

  attr_accessor :books

  def initialize
    #@books = YAML::load_file(File.join(__dir__, 'data.yml'))
  end

end

#books = YAML::load_file(File.join(__dir__, 'data.yml'))
#puts @books[0][title]
