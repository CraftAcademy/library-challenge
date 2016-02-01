require './lib/person'

describe Person do
  it 'has an empty bookshelf at instatiation' do
    expect(subject.book_shelf).to eq []
  end
end
