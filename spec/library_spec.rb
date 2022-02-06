require './lib/library.rb'
require 'date'

describe Library do

    after do
      original_data = YAML.load_file('./lib/data.yml')
      File.open('./lib/data.yml', 'w') { |f| f.write original_data.to_yaml }
    end

    it 'shows list of books' do
      expect(subject.collection).not_to be_nil
    end

    it 'shows all available books' do
      expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:available] == true }
      expect(subject.available_books).to eq expected_output
    end

    it 'allows to search for specific book title' do
      expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:item][:title] == book }
      expect(subject.search_title('Pippi Långstrump')).to eq expected_output
    end

    it 'allows to search for specific book author' do
      expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:item][:author] == book }
      expect(subject.search_author('Astrid Lindgren')).to eq expected_output
    end

    it 'successfully lend out a book' do
      expected_output = {:message=>'booked successfully'}
      expect(subject.lend_out_book('Osynligt med Alfons')).to eq expected_output
    end

end