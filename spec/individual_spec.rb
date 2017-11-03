require './lib/individual'

describe 'Individual' do
  it 'has an empty list of books on initialize' do
    expect(subject.books).to eq book_list[]
  end
end
