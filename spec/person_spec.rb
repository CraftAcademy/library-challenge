require './lib/person.rb'

describe Person do

  it 'has a list of books on initialize' do
    expected_output = { item: '', author: '', available: '', return_date: '' }
  end

  it 'should be able to return books to the library' do
  expect(subject.perform_returnbook('Pettsson och Findus')).to eq 'Book has been returned'
  end
end
