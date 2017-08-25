require 'date'

class Library
  STANDARD_VALIDITY_MONTHS = 1

  attr_accessor :collection, :exp_date

  def initialize
    @collection = YAML.load_file('./books/data.yml')
    @exp_date = Date.today.next_month(STANDARD_VALIDITY_MONTHS).strftime('%d/%m')
  end

  def checkout
    collection.select { |obj| obj[:available]}
  end
end
