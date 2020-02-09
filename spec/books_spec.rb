require './lib/books.rb'
require 'pry-byebug'
require 'yaml'
require 'pry'

describe Books do

    it 'outputs a list of all books' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.catalog).to eq expected_output
    end

    it 'can search book list by title' do
        expected_output = YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title].include? "Pippi Långstrump"  }
        expect(subject.query_title("Pippi Långstrump")).to eq expected_output
    end

    it 'can search book list by author' do
        expected_output = YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:author].include? "Astrid"  }
        expect(subject.query_author("Astrid")).to eq expected_output
    end

end