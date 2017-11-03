require './lib/library.rb'
require 'date'

describe Library do
   let(:person) { instance_double('Person', name: 'Alfred', books: []) }

   it 'has a collection of books on initialize' do
     expect(subject.collection).not_to be nil
   end

   it 'person can see a list of available books' do
     expect(subject.booklist).to be_kind_of(Array)
   end
   describe 'person can checkout a book' do
     before { subject.checkout('Osynligt med Alfons', person) }
     it "and persons book array isn't empty" do
       expect(person.books[0]).not_to be nil
     end
     it 'the right book has been checked out' do
       expect(person.books[0]).to eq title: 'Osynligt med Alfons', author: 'Gunilla Bergström'
     end
     it 'and the availability in the library collection is set to false' do
       expect(subject.collection[2][:available]).to eq false
     end
     it 'a return date is set to library collection' do
       expect(subject.collection[2][:return_date]).to eq Date.today.next_month(1).strftime('%d/%m/%y')
     end
   end

end
