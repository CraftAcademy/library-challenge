require './lib/library.rb'

describe Library do

  it 'responds to #books' do 
    expect(subject).to respond_to :books
  end

    it 'stores #books as an Array' do 
    expect(subject.books).to be_a Array
  end

  it 'has books stored as a collection of hashes' do 
    expect(subject.books.first).to be_a Hash
  end

  it 'can access books from the array' do
    expect(subject.books.first[:item][:title]).to eq "Alfons och soldatpappan"
  end

  it 'can tell if a book is available or not' do
    expect(subject.books[1][:available]).to be false
  end


end