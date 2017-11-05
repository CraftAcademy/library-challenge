require './lib/library'

describe Library do
  it 'has a collection of books on intialize' do
    expect(subject.collection).not_to be nil
  end
  it 'makes a list of books that are On site or Loaned' do
    expect(subject.book_list).to be_truthy
  end
end
