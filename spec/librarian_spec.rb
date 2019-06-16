require 'date'
require './lib/librarian.rb'

describe Librarian do
    subject { described_class.new }
    
    it 'checks book collection status of the selected library.' do
        library = Dewey.new
        expect(subject.check_books(library)).not_to eq nil
    end

end