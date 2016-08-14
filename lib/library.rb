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



  def check_in(item_number)
    items[item_number][:available] = true
    items[item_number][:return_date] = nil
    update_list
  end

  def lend(item_number)
    case
    when no_item_available?(item_number) then
      raise 'Item not found'
    when item_not_available?(item_number) then
      raise 'Item not available'
  #  when incorrect_pin?(pin_code, account.pin_code) then
  #    give_error_message('wrong pin')
  #  when card_expired?(account.exp_date) then
  #    give_error_message('card expired')
  #  when account_disabled?(account.account_status) then
  #    give_error_message('account disabled')
    else
      check_out(item_number)
    end
  end

  private

  def check_out(item_number)
    items[item_number][:available] = false
    do_return_date(item_number)
  end

  def due_date
    Date.today.next_month
  end

  def update_list
    File.open('./lib/library_list.yml', 'w') { |f| f.write items.to_yaml }
  end

  def no_item_available?(item_number)
    items[item_number].nil?
  end

end
