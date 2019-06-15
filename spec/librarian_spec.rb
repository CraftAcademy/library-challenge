## import files and built-in methods using <require('name')>
require 'date'
require './lib/librarian.rb'

describe Librarian do
    subject { described_class.new }
    
    it 'checks book collection status in the library' do
        library = Dewey.new
        expect(subject.check_books(library)).not_to eq nil
    end

end