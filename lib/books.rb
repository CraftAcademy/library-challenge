require 'yaml'
books = YAML.load_file('./lib/data.yml')
puts books
books = [item1:]
books.each do |title|
puts "#{title[:title]}" end


# class Books
#     attr_accessor :item

#     def initialize
#       @item = [YAML.load_file('./lib/data.yml')]
#     end
# end




