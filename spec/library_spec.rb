require 'date'
require 'pry-byebug'
require './lib/person.rb'
require './lib/library.rb'


describe Library do
  let()
  it 'checks that there is a collection of books' do
    expect(:book).not_to be_empty
  end


end
