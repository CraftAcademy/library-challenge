require 'yaml'
require 'date'
require 'pry'
require './lib/person.rb'

class Library

attr_accessor :items

def initialize
  @items = YAML.load_file('./lib/data.yml')
end

def check_out(title, person)
 case
 when
   if_not_available?(title, person) then 'Book is not available'
 else
   perform_checkout(title, person)
 end
end

def see_list
  items.each {|x| puts x }
end

def perform_checkin(title)
  add_book(title, available: true, return_date: '')
  # File.open('./lib/data.yml', 'w') { |f| f.write @items.to_yaml }
  # perform_returnbook(item)
end

def perform_checkout(title, person)
  change_status(title, available: false, return_date: Date.today + 30)
  person.perform_borrow(title)
  # File.open('./lib/data.yml', 'w') { |f| f.write @items.to_yaml }
end

def if_not_available?(title, person)
  check_status(title, available: false)
end

private

def add_book(title, args)
  @items.detect do |x|
    if x[:item][:title] == title
      x[:available] = args[:available]
      x[:return_date] = args[:return_date]
    end
  end
end

def check_status(title, args)
  @items.detect do |x|
    if x[:item][:title] == title
      x[:available] == args[:available]
    end
  end
end

def change_status(title, args)
  @items.detect do |x|
    if x[:item][:title] == title
      x[:available] = args[:available]
      x[:return_date] = args[:return_date]
    end
  end
end
end
