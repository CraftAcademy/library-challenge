require "./lib/library.rb"
require'date'



describe Library do
    
it 'check if book catalogue exist' do
    expect(subject.catalogue).to_not eq nil 
end

  
it 'show book list' do
    expect(subject.book_list).to_not eq nil
end

it 'show list of books with title' do
    
      expect(subject.show_title).to_not eq nil
  end

  it 'check if the book is unavailable' do
      expect(subject.book_status).to eq :available
  end

  it 'expected to have an return date on initialize' do
      expected_date = Date.today.next_day(30).strftime('%d/%m')
      expect(subject.return_date).to eq expected_date
  end

end

