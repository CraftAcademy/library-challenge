require 'date'
require 'yaml'
require 'pry'

class Library
  attr_accessor :items

  def initialize
    @items = YAML.load_file('./lib/data.yml')
  end

  def check_out(item, user)
    case
      when !book_shelf_okay?(user) then {message: 'You have books that are overdue!'}
      when !item[:available] then {message: 'Book is not available'}
      else
        perform_check_out(item, user)
    end
  end

  def check_in(item, user)
    set_item_status(item, available: true, return_date: nil)
    update_yaml_file
    user.book_shelf.delete check_out_message(item)
  end

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

  private

  def set_today
    Date.today.strftime('%F')
  end

  def set_return_date
    Date.today.next_month.strftime('%F')
  end

  def set_item_status(item, args={})
    @items.detect do |i|
      if i[:item][:title] == item[:item][:title]
        i[:available] = args[:available]
        i[:return_date] = args[:return_date]
      end
    end
  end

  def perform_check_out(item, user)
    set_item_status(item, available: false, return_date: set_return_date)
    update_yaml_file
    user.book_shelf.push check_out_message(item)
  end

  def check_out_message(item)
    {title: item[:item][:title],
     author: item[:item][:author],
     checked_out_date: set_today,
     return_date: set_return_date}
  end

  def book_shelf_okay?(user)
    user.book_shelf.select { |a| a[:return_date] < Date.today.strftime('%F') }.empty?
  end

  def update_yaml_file
    File.open('./lib/data.yml', 'w') { |f| f.write @items.to_yaml }
  end
end
