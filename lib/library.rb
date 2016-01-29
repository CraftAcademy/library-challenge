class Library
  attr_accessor :items

  def initialize(options={})
    @items = options[:items] || []
  end

  def check_out(user, args={})
    if find_item(args)
      check_out_item(user, @item)
    else
      binding.pry
    end
  end


  private

  def find_item(args={})
    @item = @items.detect{|obj| obj[args.keys.first] == (args[args.keys.first]).to_s }
  end

  def check_out_item(user, item)
    response = { item: @item,
                 lender: user,
                 checked_out_date: Date.today.strftime('%F'),
                 return_date: Date.today.next_month.strftime('%F')}
  end
end
