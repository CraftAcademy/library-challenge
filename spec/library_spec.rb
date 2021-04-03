require './lib/library.rb'
require 'date'

describe Library do
  it 'reads book.yml as an object' do
    expect(subject.read_book_list).not_to be nil
  end
end