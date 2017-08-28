require './lib/person'

describe Person do
  it 'can show books person has in possession' do
    expect(subject.person_shelf).to eq 'Nobody has borrowed BoAlfons och soldatpappanok'
  end

  it 'can see a list of books currently available in the library with title and author' do
    expect(subject.available).to eq 'Book is available for borrowing'
  end

  it 'can know when the book is supposed to be returned' do
    expect(subject.return_date).to eq 'Book is due to be returned today'
  end
end
