require 'yaml'

class Book
  STANDARD_VALIDITY_DAYS = 30
  attr_accessor :exp_date, :visitor

  def initialize(attrs = {})
    @exp_date = set_return_date
    @visitor = visit_library(attrs[:visitor])
  end

  def collection
    YAML.load_file('./lib/data.yml')
  end

  def set_return_date
    Date.today.next_day(STANDARD_VALIDITY_DAYS).strftime('Any books have to be returned by: %d/%m/%y')
  end

  def search(title)
    collection.select { |obj| obj[:item][:title].include? title  }
  end

  def visit_library(visitors)
      visitors == nil ? no_visitors : visitors
  end

  def no_visitors
    raise 'There are no visitors.'
  end


  # def checkout(attrs={})
  #   collection([])
  # end

  # def withdraw(args = {})
  #   @account == nil ? no_account_present : withdraw_funds(args)
  # end

  # def withdraw_funds(args)
  #   account = @account
  #   amount = args[:amount]
  #   pin = args[:pin]
  #   atm = args[:atm]
  #   atm == nil ? no_atm_present : atm
  #   response = atm.withdraw(amount, pin, account)
  #   response[:status] == true ? increase_cash(response) : response
  # end

  # collection[0][:available] = false
  # File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }

end