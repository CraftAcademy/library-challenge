 #YAML for database with list of available 
    #books (title, author availability)
require './lib/library.rb'
require 'yaml'
require 'date'

describe Library do
    let(:yaml) {instance_double()}

    it 'is expected to see the title of a book' do
        collection=YAML.load_file('./lib/data.yml')
        expect(subject.title).to eq collection.select{|obj| obj[:item][:title].include?"Alfons och soldatpappan"}
    end

    it 'is expected to see the author of a book' do 
        expect(subject.author).to eq :author
    end

    it 'is expected to see the availability of a book' do
        expect(subject.available).to eq :available
    end

    it 'is expected to store all books in an easily accessable file' do
        expect()
    end

    it 'is expected to see the availability of a book' do
        expect()
    end

    it 'is expected to search for the book I want to read' do
        expect()
    end

    it 'is expected to check out the book I want to read' do
        expect()
    end

    it 'is expected to set a required date of return of one month for every book' do
        expected_date = Date.today.next_month(1).strftime("%d/%m")
        expect(subject.return_date).to eq expected_date
    end
   
end