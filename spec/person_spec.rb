require 'yaml'
require './lib/person.rb'

collection = YAML.load_file('./lib/data.yml')
describe Person do


    it 'list of the person checkout books' do
      expect(subject.book_list).to eq collection.select { |obj| obj[:available] == false  }
    end

    it 'person whants to checkout book' do
      expect(subject.person_checkout).to eq true
    end

end
