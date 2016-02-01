require 'date'

class Library
  attr_accessor :items

  def initialize(options={})
    @items = options[:items] || []
  end

  def check_out(item, user)
    @items.detect do |i|
      if i[:item][:title] == item[:item][:title]
        i[:available] = false
        i[:return_date] = set_return_date
      end
    end
    user.book_shelf.push check_out_message(item)
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
end
