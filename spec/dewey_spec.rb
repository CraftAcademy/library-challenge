## import files and built-in methods using <require('name')>
require 'date'
require './lib/dewey.rb'

describe Dewey do
    subject { described_class.new }
    it 'books.yml loaded successfully' do
        expect(subject.books).not_to eq nil
    end

end