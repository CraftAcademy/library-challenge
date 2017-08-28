require './lib/library.rb'
require 'date'

class User
  attr_accessor :books, :name

  def initialize(attrs = {})
    @books = []
    @name = attrs[:name]
  end
end
