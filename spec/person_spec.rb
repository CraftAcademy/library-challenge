require './lib/person'

describe Person do
  it 'can see a list of books currently available in the library' do
    expect(subject.available).to eq 'Book is available for borrowing'
  end

  it 'can know when the book is supposed to be returned' do
    expect(subject).not_to eq object
  end
end
