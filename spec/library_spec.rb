require './lib/library.rb'

describe Library do
   let(:person) { instance_double('Person', name: 'Alfred', books: []) }

   it 'has a collection of books on initialize' do
     expect(subject.collection).not_to be nil
   end

   it 'person can see a list of available books' do
     expect(subject.booklist).to be_kind_of(Array)
   end

   it 'person can check out a book' do
     subject.checkout('Osynligt med Alfons', person)
     expect(person.books[0]).not_to be nil
   end

end
