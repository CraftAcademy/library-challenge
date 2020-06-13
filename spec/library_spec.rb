require "./lib/library.rb"
require'date'



describe Library do
    
it 'check if book catalogue exist' do
    expect(subject.catalogue).to_not eq nil 
end

  it 'show list of books with title' do
      expected_output = 'Alfons och soldatpappan'
      expect(subject.show_title).to eq expected_output
  end

#   it 'check if the book is unavailable' do
#       expect(subject.book_status).to eq :available
#   end

end

