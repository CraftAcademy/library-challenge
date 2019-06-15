## import files and built-in methods using <require('name')>
require 'date'
require './lib/librarian.rb'

describe Librarian do
    subject { described_class.new }
    
    it 'checked books status in collection.yml' do
        expect(subject.check_books).not_to eq nil
    end

end