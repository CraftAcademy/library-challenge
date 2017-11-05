require './lib/library'

describe Library do
  it 'has a collection of books on intialize' do
    expect(subject.collection).not_to be nil
  end
  it 'makes a list of books that are on-site or Loaned' do
    expect(subject.book_list).to be_truthy
  end
  it 'searches book title' do
    expect(subject.search_title).to be_truthy
  end
  it 'sets a date when book is checked out' do
    expect(subject.check_out).not_to be nil
  end
end
