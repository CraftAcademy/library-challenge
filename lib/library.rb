require 'yaml'
require 'date'
require 'pry'
require './lib/person.rb'

class Library

attr_accessor :items

def initialize
  @items = YAML.load_file('./lib/data.yml')
end

def check_out(title)
 case
 when
   if_not_available?(title) then 'Book is not available'
 else
   perform_checkout(title)
 end
end

def perform_checkin(title)
  add_book(title, available: true, return_date: '')
  # File.open('./lib/data.yml', 'w') { |f| f.write @items.to_yaml }
  # perform_returnbook(item)
end

def perform_checkout(title)
  change_status(title, available: false, return_date: Date.today + 30)
  # File.open('./lib/data.yml', 'w') { |f| f.write @items.to_yaml }
  # perform_borrow(item)
end

def if_not_available?(title)
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
