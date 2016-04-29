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

end
