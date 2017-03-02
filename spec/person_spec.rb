require './lib/person.rb'

describe Person do

  it 'has a list of books on initialize' do
    expected_output = { title: '', author: '', available: '', return_date: '' }
  end
end
