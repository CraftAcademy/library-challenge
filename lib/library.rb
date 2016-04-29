class Library
  attr_accessor :catalog
  DEFAULT_CHECKOUT_PERIOD = 1

  def initialize
    @catalog = YAML.load_file('./lib/catalog.yml')
  end

  def checkout(book, person)
    @catalog.detect do |item|
      if item[:item][:title] == book[:item][:title]
        item[:available] = false
        item[:return_date] = Date.today.next_month(DEFAULT_CHECKOUT_PERIOD)
      end
    end
    File.open('./lib/catalog.yml', 'w') { |f| f.write @catalog.to_yaml }
    person.my_books.push(book)
  end

  def checkoutmsg
    case
    when checkout(book, person) then
      {status: true, message: 'To be returned by: ', date: Date.today.next_month}
    else
      checked_out
    end
  end

  def checked_out
    @catalog.detect do |check|
      if check[:available] = false then
        {status: true, message: 'Sorry, this item is not available'}
      end
    end
  end

end
