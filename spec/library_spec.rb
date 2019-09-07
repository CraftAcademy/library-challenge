require './lib/library.rb'

describe Library do

  it 'responds to #books' do 
    expect(subject).to respond_to :books
  end

    it 'stores #books as an Array' do 
    expect(subject.books).to be_a Array
  end

  it 'has books that holds a collection of hashes' do 
    expect(subject.books.first).to be_a Hash
  end

  it 'first item in books is "Alfons och soldatpappan"' do
    expect(subject.books.first[:item][:title]).to eq "Alfons och soldatpappan"
  end


end