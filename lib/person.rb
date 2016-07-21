require './lib/library.rb'

class Person
  attr_accessor :list

  def initialize
    @list = []
  end

  def add_to_list(result)
    @list.push( { :title => result[:title],
                  :author => result[:author],
                  :return_date => result[:return_date] } )
  end

end
