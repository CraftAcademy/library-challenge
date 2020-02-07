require 'yaml'
require './lib/library.rb' #links to this file so the tests can refer to this code

describe Library do 

    #it 'add new books' do
    #end

    #it 'delete old books' do
    #end

    #it 'search for books by title' do
    #end

    #it 'search for books by author' do
    #end

    #it 'books status shown' do
    #end

    it 'view all books' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.catalog).to eq expected_output
    end

end





