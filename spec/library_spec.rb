require 'yaml'
require './lib/library.rb'
require './lib/user.rb'

describe Library do 

    it 'can view the list of the :collection of books' do 
        expect(subject.collection).to be_truthy 
    end

    it 'checks if the book Alfons och soldatpappan is available' do 
        expected_output= YAML.load_file('./lib/data.yml').select{|collection|collection[:item][:title] == 'Alfons och soldatpappan'}
        expect(subject.book_status('Alfons och soldatpappan')).to eq expected_output
    end

    it 'search for a book by title' do 
        expected_output= YAML.load_file('./lib/data.yml').select{|collection|collection[:item][:title].include? 'Pippi Långstrump'}
        expect(subject.title_search('Pippi Långstrump')).to eq expected_output
    end

    it 'search for a book by author' do 
        expected_output= YAML.load_file('./lib/data.yml').select{|collection|collection[:item][:author].include? 'Astrid Lindgren'}
        expect(subject.author_search('Astrid Lindgren')).to eq expected_output
    end

    it 'return date for when the book should be back' do 
        subject.book_return_date("Pippi Långstrump går ombord")
        expect(subject.collection[4][:available]).to be false
        expect(subject.collection[4][:return_date]).to eq Date.today.next_month(1).strftime("%m/%y")
    end

    it 'get message when book should be returned' do
        expected_output = 'The book should be returned within a month'
        expect(subject.return_book('Skratta lagom!')).to eq expected_output
    end


end
