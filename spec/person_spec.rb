require './lib/person.rb'

describe Person do

  before(:each) do
    @person = Person.new
  end

  it 'person should have bookshelf' do
      expect(@person).to respond_to(:bookshelf)
  end

  it 'can checkout a book' do
    book = 'Osynligt med Alfons'
    expect(@person.checkout(book)).to eq book
  end

  xit 'sets a books status to false if checked out' do
    expect(subject.set_book_availability(book)).to eq book
  end

end
