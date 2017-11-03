require './lib/library.rb'

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
       expect(person.books[0]).to eq title: 'Osynligt med Alfons'
     end
   end

end
