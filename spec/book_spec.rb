require './lib/book.rb'

describe Book do

  it 'responds to #books' do 
    expect(subject).to respond_to :collection
  end

    it 'stores #books as an Array' do 
    expect(subject.collection).to be_a Array
  end

  it 'has books stored as a collection of hashes' do 
    expect(subject.collection.first).to be_a Hash
  end

  it 'can get a book from the list' do
    expect(subject.collection.first[:item][:title]).to eq "Alfons och soldatpappan"
  end

  it 'can tell if a book is available or not' do
    expect(subject.collection[1][:available]).to be false
  end

  it 'is expected to have an expiration date on initialize' do
    expected_date = Date.today.next_month(1).strftime('%d/%m/%y')
    expect(subject.exp_date).to eq expected_date
  end

  describe 'when loaning a book' do  
  let(:person) { instance_double('Person', :exp_date) }
    before do
      allow(person).to receive(:a_book).and_return('Your book is #{[:item][:title]')
      allow(person).to receive(:a_book=)
    end

    it 'allows a person to loan a book if the book is available' do
      expected_output = { message: 'The book is available', date: Date.today, book: 'Your book is #{[:item][:title]}'
      expect(subject.search([:item][:title], person)).to eq expected_output
    end

  end

end