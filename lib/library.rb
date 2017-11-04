# require 'yaml'

# class Library
#   attr_reader :books
#
#   def initialize
#     @books = YAML.load_file('./lib/data.yml')
#   end
#
#
#   private
#
#   def book_unavailable?(book_num)
#     @books[book_num][:available] == false
#   end
# end
