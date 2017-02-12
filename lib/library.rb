require 'yaml'
require 'date'

class Library

attr_accessor :items

def initialize
  @items = YAML.load_file('./lib/data.yml')
end

#def check_out(item)    <=====Something i want to use later to check availability and raise error.
#  case
#  when
#    if_not_available?(item) then
#      puts 'Book is not available'
#  else
#  perform_checkout(item)
#  end
#end

private

def if_not_available?(item)
  check_status(item, available)
end

def check_status(item, available)
  @items.detect do |x|
    if x[:item][:title] == item[:item][:title]
      x[:available] = false
end
end

def perform_checkout(item)
  change_status(item, available: false, return_date: Date.today + 30) #<===Partial solution from class video
#  @items.detect do |x|         <=====Why can't i do this instead?
#  if x[:available] = false
#  x[:return_date] =  Date.today + 40
end
end
def change_status(item, args={})   #<=====Partial solution from class video
  @items.detect do |x|
    if x[:item][:title] == item[:item][:title]
      x[:available] = args[:available]
      x[:return_date] = args[:return_date]
    end
  end
end
end
end
