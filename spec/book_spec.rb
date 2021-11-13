require './lib/book.rb'

describe Book do
  subject { described_class.new(title: "1984", author: "George Orwell", available: true) }

end
