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

  it 'can get a book from the list' do
    expect(subject.books.first[:item][:title]).to eq "Alfons och soldatpappan"
  end

  it 'can tell if a book is available or not' do
    expect(subject.books[1][:available]).to be false
  end

  describe 'when loaning a book' do
    subject {described_class.new(book)}
    let(:book) { instance_double('Book', :exp_date) }  

    it 'is expected to have an expiration date on initialize' do
      expected_date = Date.today.next_month(1).strftime('%d/%m/%y')
      expect(subject.exp_date).to eq expected_date
    end

  end

end