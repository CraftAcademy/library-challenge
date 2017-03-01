require './lib/shelf.rb'

describe Shelf do

  let(:person) { double('Person', check_out: true, check_in: true)}

  it 'has a list of books on initialize' do
    expected_output = { title: '', author: '', available: '', return_date: '' }
  end
end
