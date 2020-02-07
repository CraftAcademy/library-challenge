require 'yaml'
require './lib/library.rb' #links to this file so the tests can refer to this code

describe Library do 
    let(:catalog)  { instance_double( title: 'Lord of the rings', author: 'JRR Tolkien', available: true ) }
      
before { subject.add_book}
        
it "add new books" do
    expected_output == '{:title=>"Lord of the rings", :author=>"JRR Tolkien", :available=>true}'
    expect(catalog.select { |obj| obj[:item][:title] == 'Lord of the rings'  }).to eq expected_output
    end

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





