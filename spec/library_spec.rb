require './lib/library.rb'

describe Library do
   let(:person) { instance_double('Person', name: 'Alfred') }

   it 'has a collection of books on initialize' do
     expect(subject.collection).not_to be nil
   end

   it 'person can see a list of available books' do
     expect(subject.booklist).to be_kind_of(Array)
   end

end
