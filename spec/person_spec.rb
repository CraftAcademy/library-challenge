require './lib/person.rb'

describe Person do

  it 'person should have bookshelf' do
      expect(subject).to respond_to(:bookshelf)
  end

  it 'can checkout a book' do
    book = 'Osynligt med Alfons'
    expect(subject.checkout(book)).to eq book
  end

  xit 'sets a books status to false if checked out' do
    expect(subject.set_book_availability(book)).to eq book
  end

end
