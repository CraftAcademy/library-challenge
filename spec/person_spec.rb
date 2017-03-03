require './lib/person.rb'

describe Person do

  let(:library) { double('Library')}

  before do
    allow(library).to receive(:see_list)
    .and_return(hash)
  end

  it 'has a bookshelf where it can put books on initialize' do
    expect(subject.books).to be_kind_of Array
  end

  it 'should be able to see list of books in library' do
    expect(subject.watch_list(library)).not_to be nil
  end

  it 'should be able to return books to the library' do
    subject.perform_returnbook('Skratta lagom! Sa pappa Åberg')
    expect(subject.books).to eq []
  end

  it 'should be able to borrow books from library' do
    expected_output = {item: {title: "Skratta lagom! Sa pappa Åberg", author: "Gunilla Bergström"}, available: true, return_date: Date.today + 30 }
    expect(subject.perform_borrow('Skratta lagom! Sa pappa Åberg')).to eq expected_output
  end

  it 'should have a book in its shelf after borrowing' do
    subject.perform_borrow('Skratta lagom! Sa pappa Åberg')
    expect(subject.books).not_to be []
  end

end
