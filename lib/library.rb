require "yaml"
require "Date"

class Library
  attr_accessor :items

  def initialize
    @items = YAML.load_file('./lib/library_list.yml')
  end

  def set_return_date(item_number)
    items[item_number][:return_date] = due_date
    File.open('./lib/library_list.yml', 'w') { |f| f.write items.to_yaml }
    items[item_number][:return_date]
  end

  def check_out(item_number)
    items[item_number][:available] = false
    set_return_date(item_number)
  end

  private

  def due_date
    #lägger till en månad till dagens datum
    Date.today.next_month
  end

end
