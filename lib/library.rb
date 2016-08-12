require "yaml"
require "Date"

class Library
  attr_accessor :items

  def initialize
    @items = YAML.load_file('./lib/library_list.yml')
  end

  def set_return_date(item_number)
    items[item_number][:return_date] = "2022-12-12"
    File.open('./lib/library_list.yml', 'w') { |f| f.write items.to_yaml }
    items[item_number][:return_date]
  end

end
