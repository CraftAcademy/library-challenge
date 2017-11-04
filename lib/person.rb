#require './lib/data.yml'
require "yaml"

class Person

  attr_accessor :name, :books

  def initialize(name)
    @name = set_name(name)
#    @books = books
  end

  def set_name(obj)
    #obj == nil ?  missing_name :
    @name = obj
  end

#  def missing_name
#    raise "A name is required"
#  end

  def list_of_books
    @books 
  #  @books = YAML.load_file(".lib/data.yml")
  end

#  def loan_books(books)
#    @account == nil ? no_account : @account.balance += books

#  end
end
