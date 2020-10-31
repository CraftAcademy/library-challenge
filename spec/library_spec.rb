require 'yaml'
require './lib/library.rb'

describe Library do
    #let (:book){instance_double('Pippi')}
    #expect (subject.collection).to be_truthy

    it 'checks if book is available' do
        expect(subject.book_status).to eq :available
    end
    
    it 'can view the list of the :collection of books' do
        expect(subject.collection).to be_truthy
    end

    it 'search for a book by title' do
        expected_output= YAML.load_file('./lib/data.yml').select{|collection|collection[:item][:title].include? 'Pippi Långstrump'}
        expect(subject.title_search('Pippi Långstrump')).to eq expected_output
    end

    it 'search for a book by author' do
        expected_output= YAML.load_file('./lib/data.yml').select{|collection|collection[:item][:author].include? 'Astrid Lindgren'}
        expect(subject.author_search('Astrid Lindgren')).to eq expected_output
    end

  
end
