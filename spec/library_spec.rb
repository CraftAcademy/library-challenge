require 'yaml'

require './lib/library.rb'

describe Library do
    #let (:book){instance_double('Pippi')}
    #expect (subject.collection).to be_truthy

    it 'checks if book is available' do
        expect(subject.book).to eq 'Pippi'

    end
    
    it 'can view the list of the :collection of books' do
        expect(subject.collection).to be_truthy
    end

end
