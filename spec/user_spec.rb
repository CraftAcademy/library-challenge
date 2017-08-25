require './lib/user.rb'

describe User do
  it 'is expected to have no books on initialize' do
    expect(subject.books).to eq nil
  end

  it 'should be able to see its books' do
    expect(subject.borrowed_books).to eq subject.books
  end

end
