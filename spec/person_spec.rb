require './lib/person.rb'

describe Person do
  subject { described_class.new(name:'Jim') }

  it 'has a name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'has please enter name' do
    expect{ described_class.new }.to raise_error 'please enter name'
  end

  it 'can check_out a book' do
    library = Library.new
    expected_output = { status: true, message: 'check_out complete', book_id: 1234, date: Date.today, return_date: Date.today.next_month }
    expect(subject.perform_check_out({book_id:1234, library: library})).to eq expected_output
  end

  it 'adds the book I check out to my list of current books' do
     library = Library.new
     subject.perform_check_out({book_id:1234, library: library})
     expect(subject.current_books.length).to be > 0
  end

  it 'removes the book I return from my list of current books' do
    library = Library.new
    subject.perform_check_out({book_id:1234, library: library})
    subject.perform_return({book_id:1234, library: library})
    expect(subject.current_books.length).to eq 0
  end


end
