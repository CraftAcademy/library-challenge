require './lib/visitor.rb'
require './lib/library.rb'
require 'date'

describe Visitor do
   
   it 'visitor should be able to search for books with keywords' do
      expect(subject.book_search).to_not be nil
   end

   it 'check if the book is available' do
      expect(subject.check_available_books).to_not eq false
  end
   
   it 'visitor can checkout a book' do
      expected_output = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>Date.today.next_month.strftime('%d/%m/%y')}
      expect(subject.checkout_book).to eq expected_output
   end

   it 'visitor can return the book' do
      expected_output = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}
      expect(subject.return_book).to eq expected_output
   end
   



end