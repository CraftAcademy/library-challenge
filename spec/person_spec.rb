require 'yaml'
require './lib/person.rb'

collection = YAML.load_file('./lib/data.yml')
describe Person do

    it 'list of books currently available in the library' do
      expect(subject.available_books).not_to eq nil
    end

    it 'list of the person checkout books' do
      expect(subject.borrowd_book_list).to eq collection.select { |obj| obj[:available] == false  }
    end

end
