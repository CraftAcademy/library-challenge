require './lib/person.rb'
require 'date'
require 'yaml'

describe Person do
  it 'expect to checkout the book in the library upon request' do
    expect(subject.checkout).to respond_to(request)
  end
end
