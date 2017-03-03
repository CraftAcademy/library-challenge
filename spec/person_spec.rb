require 'yaml'
require './lib/person.rb'


person = YAML.load_file('./lib/person.yml')
describe Person do

    subject { described_class.new }

    it 'list of books currently available in the library' do
      expect(subject.available_books).not_to eq nil
    end

    it 'list of the person checkout books' do
      expect(subject.borrowd_book_list).to eq person.select { |obj| obj[:available] == true  }
    end

    it 'have a collection of books stored in a file' do
      expect(person).not_to eq nil
    end

end
