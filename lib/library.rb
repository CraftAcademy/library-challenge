require 'yaml'
require 'date'
require 'pry'

class Library

attr_accessor :items

def initialize
  @items = YAML.load_file('./lib/data.yml')
end

def check_out(item)
 case
 when
   if_not_available?(item) then 'Book is not available'
 else
   perform_checkout(item)
 end
end

def perform_checkin(item)
  add_book(item, avaialable: true, return_date: '')
end

def perform_checkout(item)
  change_status(item, available: false, return_date: Date.today + 30)
  # update_yaml_file   <==== add yaml file update method later.
end

def if_not_available?(item)
  check_status(item, available: false)
end

private

def add_book(item, args)

end

def check_status(item, args)
  @items.detect do |item|
    if item[:item][:title] == item[:item][:title]
      item[:available] == args[:available]
    end
  end
end

def change_status(item, args)
  @items.detect do |item|
    if item[:item][:title] == item[:item][:title]
      item[:available] = args[:available]
      item[:return_date] = args[:return_date]
    end
  end
end
end
