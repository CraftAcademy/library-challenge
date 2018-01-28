require './lib/library.rb'

class Client

  attr_accessor :bookshelf

  def initialize
    @bookshelf = []
  end
end
