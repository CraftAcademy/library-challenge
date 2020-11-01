require 'yaml'
require './lib/library.rb'
require './lib/user.rb'

describe Library do

    it 'can view the list of the :collection of books' do #1 ok
        expect(subject.collection).to be_truthy
    end

    it 'search for a book by title' do #3 ok
        expected_output= YAML.load_file('./lib/data.yml').select{|collection|collection[:item][:title].include? 'Pippi Långstrump'}
        expect(subject.title_search('Pippi Långstrump')).to eq expected_output
    end

    it 'search for a book by author' do #4 ok
        expected_output= YAML.load_file('./lib/data.yml').select{|collection|collection[:item][:author].include? 'Astrid Lindgren'}
        expect(subject.author_search('Astrid Lindgren')).to eq expected_output
    end

    it 'return date for the book' do #5
        expected_date= Date.today.next_month(1).strftime("%m/%y")
        expect(subject.return_date).to eq expected_date
    end

end
