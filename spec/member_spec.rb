## import files and built-in methods using <require('name')>
require 'date'
require './lib/member.rb'

describe Member do
    
    it 'provides member name' do
        member1 = described_class.new(name: 'Max') 
        expect(member1.name).to eq 'Max'
    end
    
    it 'shows available books in the collection of the selected library' do
        subject { described_class.new }
        library = Dewey.new
        expect(subject.check_available_books(library)).not_to eq nil
    end

end