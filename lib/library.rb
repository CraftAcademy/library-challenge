class Library
  attr_accessor :catalog
  DEFAULT_CHECKOUT_PERIOD = 1

  def initialize
    @catalog = YAML.load_file('./lib/catalog.yml')
  end

  def checkout(book)
    book[:available] = false
    book[:return_date] = Date.today.next_month(DEFAULT_CHECKOUT_PERIOD)
  end

end
