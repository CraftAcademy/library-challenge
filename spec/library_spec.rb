require 'yaml'
require './lib/library'

describe Library do

  it 'should have books available' do
    expect(subject.books).not_to be nil
  end
end
