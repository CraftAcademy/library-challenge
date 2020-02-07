require 'yaml'
require './lib/library.rb' #links to this file so the tests can refer to this code

describe Library do 
 { instance_double( title: 'Lord of the rings', author: 'JRR Tolkien ' , available: True) }
      
#before { subject.add_book}
        
it "add new books" do
    expected_output = 'Lord of the rings'
    expect(subject.catelog.detect { |obj| obj[:item][:title] == "Lord of the rings"  }).to eq expected_output
    end
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





