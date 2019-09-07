require 'yaml'

class Library
  STANDARD_VALIDITY_MONTHS = 1
  attr_accessor :books, :exp_date

  def initialize(attrs = {})
    @exp_date = set_expire_date
    @books = YAML.load_file('./lib/data.yml')
  end

  def set_expire_date
    Date.today.next_month(STANDARD_VALIDITY_MONTHS).strftime('%d/%m/%y')
  end

end