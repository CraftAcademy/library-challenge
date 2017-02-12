require 'yaml'
require './lib/library.rb'

describe Library do
  it 'should have the list of available books' do
    expect(subject.bookrack).not_to be nil
  end
end
