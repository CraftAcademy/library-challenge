require 'date'
require 'yaml'

class Library
  attr_accessor :items

  def initialize
    @items = YAML.load_file('./lib/data.yml') || []
  end

  def check_out(item, user)
    @items.detect do |i|
      if i[:item][:title] == item[:item][:title]
        i[:available] = false
        i[:return_date] = set_return_date
      end
    end
    update_yaml_file
    user.book_shelf.push check_out_message(item)
  end

  def check_in(item, user)
    @items.detect do |i|
      if i[:item][:title] == item[:item][:title]
        i[:available] = true
        i[:return_date] = nil
      end
    end
    update_yaml_file
    user.book_shelf.delete check_out_message(item)
  end

  def find(args={})
    @items.detect{|obj| obj[:item][args.keys.first] == (args[args.keys.first]).to_s }
  end

  private

  def set_today
    Date.today.strftime('%F')
  end

  def set_return_date
    Date.today.next_month.strftime('%F')
  end

  def check_out_message(item)
    { title: item[:item][:title],
      author: item[:item][:author],
      checked_out_date: set_today,
      return_date: set_return_date }
  end

  def update_yaml_file
    File.open('./lib/data.yml', 'w') {|f| f.write self.items.to_yaml }
  end
end
