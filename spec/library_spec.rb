require './lib/library.rb'
require 'yaml'
require 'date'

describe Library do

    it 'Initialize collection of books' do
        expect(subject.collection).not_to be_nil
    end

    it 'Allows person a list of available books' do
        expected_output = YAML.load_file('./lib/data.yml').select { |obj| obj[:available] == true }
        expect(subject.book_available).to eq expected_output
    end

    it 'Allows person to search for books' do
        expected_output = YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title] == obj }
        expect(subject.book_search('He Died With A Falafel in His Hand')).to eq expected_output
    end

    it 'Approved lending of books' do
        expected_output = {:message=>'The book is now approved for lending'}
        expect(subject.book_lend_out('Old Tractors and the Men Who Love Them')).to eq expected_output
    end

    after do
        data = YAML.load_file('./lib/data.yml')
        File.open('./lib/data.yml', 'w') { |f| f.write data.to_yaml }
    end
end