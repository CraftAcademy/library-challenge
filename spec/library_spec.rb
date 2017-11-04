require './lib/library'

describe Library do
  it 'has a collection of books on intialize' do
    expect(subject.collection).not_to be nil
  end
  it 'individual checks book list' do
    expect(subject.book_list).to throw_symbol(:symbol, 'value')
  end
end
