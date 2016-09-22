require './lib/library.rb'
require 'yaml'
require 'date'
require 'pry-byebug'

class Person

  attr_accessor :bookshelf

  def initialize
    @bookshelf = []
  end

  def status_of_checked_out_books
    return 'No checked out books' if @bookshelf.empty?

    #possible?
    # @bookshelf.each do |item|
    #   item[:return_date]
    # end

  end


end
