require "yaml"
require "Date"

class Library
  attr_accessor :items

  def initialize
    @items = YAML.load_file('./lib/library_list.yml')
  end

  def do_return_date(item_number)
    items[item_number][:return_date] = due_date
    update_list
    items[item_number][:return_date]
  end

  def check_out(item_number)
    items[item_number][:available] = false
    do_return_date(item_number)
  end

  def check_in(item_number)
    items[item_number][:available] = true
    items[item_number][:return_date] = nil
    update_list
  end

  private

  def due_date
    Date.today.next_month
  end

  def update_list
    File.open('./lib/library_list.yml', 'w') { |f| f.write items.to_yaml }
  end


end
