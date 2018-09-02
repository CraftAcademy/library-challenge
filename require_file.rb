require './lib/library.rb'
require './lib/borrower.rb'
require 'date'
require 'awesome_print'
require 'yaml'

lib = Library.new
robin = Borrower.new("Robin")
lib.checkout("Pippi Långstrump", robin)
