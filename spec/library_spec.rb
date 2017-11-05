require './lib/library.rb'
require 'date'

describe Library do

  it 'expects to have a list of books on initialize' do
      expect(subject.collection).not_to be nil
  end

  it 'expects to be able to present the list of books to individuals' do
    expect(subject.collection).to be_kind_of(Array)
  end
end
