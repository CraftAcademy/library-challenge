## import files and built-in methods using <require('name')>
require 'date'
require './lib/member.rb'

describe Member do
    
    it 'provides member name' do
        member1 = described_class.new(name: 'Max') 
        expect(member1.name).to eq 'Max'
    end

    describe 'of the available books in the collection of the selected library' do
        subject { described_class.new }
        library = Dewey.new
    
        it 'shows available books' do
            expect(subject.check_available_books(library)).not_to eq nil
        end

        it 'searches titles' do
            search_term = "Pippi"
            expect(subject.search_titles(library, search_term)).not_to eq nil
        end
    end
end