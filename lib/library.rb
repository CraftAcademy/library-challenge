require "yaml"
require "Date"

class Library
  attr_accessor :items

   ITEM_BORROW_TIME = 30

  def initialize
    @items = YAML.load_file('./lib/library_list.yml')
  end

  def set_return_date(item_number)
    items[item_number][:return_date] = due_date
    File.open('./lib/library_list.yml', 'w') { |f| f.write items.to_yaml }
    items[item_number][:return_date]
  end

  private

  def due_date
    #lägger till 30 till dagens datum
    Date.today.next_day(ITEM_BORROW_TIME)
  end

end
