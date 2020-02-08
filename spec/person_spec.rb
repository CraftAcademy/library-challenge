require './lib/person.rb'


describe Person do
    
    it 'has book_1 on initialize' do
        expect(subject.borrowed_book).to eq book_1
    end


end