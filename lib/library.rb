require 'yaml'
require 'date'
require 'pry-byebug'

class Library

  attr_accessor :collection

  def initialize
    @collection = YAML.load_file('./lib/data.yml')
  end

  def checkout(desired_book)
    return 'That book is unavailable' unless unavailable?(desired_book)
    book = find_title(desired_book)
    book[:available] = false
    book[:return_date] = Date.today.next_month
    book
  end

  def list_available_books
    available_books = @collection.select { |item| item[:available] == true }
  end

  def find_title(title)
    @collection.detect { |item| item[:item][:title] == title }
  end

  private
  def unavailable?(desired_book)
    book = find_title(desired_book)
    book[:available]
  end
end

# def perform_checkout(desired_book)
#   desired_book[:available] = false
#   desired_book[:return_date] = Date.today.next_month
#   #File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
# end

=begin

def find_item(args={})
    # Specific search for `:title` usage: `find_item(title: 'Alfons')`
    # @items.detect { |obj| obj[:item][:title].include?(args[args.keys.first])  }

    # Generic search for any attribute within `:item`
    # usage: `find_item(title: 'Alfons')` or `find_item(author: 'Gunilla')`

    # This method searches for an EXACT match and returns the FIRST object it finds
    #@items.detect { |obj| obj[:item][args.keys.first] == args[args.keys.first] }

    # This method searches for a PARTIAL match and returns th FIRST object it finds
    @items.detect { |obj| obj[:item][args.keys.first].include?(args[args.keys.first])  }

    # This method searches for a PARTIAL match and returns th ALL object it finds
    #@items.select { |obj| obj[:item][args.keys.first].include?(args[args.keys.first])  }
  end

=end
