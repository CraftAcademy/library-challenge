require './lib/visitor.rb'
require './lib/library.rb'
require 'date'

describe Visitor do
   
   it 'visitor should be able to search for books with keywords' do
      expect(subject.book_search).to_not be nil
   end
   
   it 'visitor can checkout a book' do
      expected_output = {:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>Date.today.next_month.strftime('%d/%m/%y')}
      expect(subject.checkout_book).to eq expected_output
   end

   



end