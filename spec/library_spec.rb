require 'yaml'
require './lib/library.rb' #links to this file so the tests can refer to this code

describe Library do 
    let(:catalog)  { instance_double( title: 'Lord of the rings', author: 'JRR Tolkien', available: true ) }
      
before { subject.add_book}
        
    #it "add new books" do
        #expected_output = '{:title=>"Lord of the rings", :author=>"JRR Tolkien", :available=>true}'
        #new_book_details = catalog.select { |obj| obj[:item][:title] == 'Lord of the rings' }
        #expect(catalog.select { |obj| obj[:item][:title] == 'Lord of the rings' }).to eq expected_output
        #end
    #it "add new books" do
        #expected_output = YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title] == 'Lord of the rings' }
        #expect(new_book_details.to_s).to eq expected_output
    #end
    #it "add new book" do
        #expect(catalog.select { |obj| obj[:item][:title] == 'Lord of the rings' }).not_to be_nil
    #end

    #it 'delete old books' do
    #end

    #it 'search for books by title' do
    #end

    #it 'search for books by author' do
    #end

    #it 'books status shown' do
    #end

    # it 'book 'checkout complete, return book on {date}' do
    #end

    #it 'book status updated when checkedout'

    it 'view all books' do
        expected_output = YAML.load_file('./lib/data.yml')
        expect(subject.catalog).to eq expected_output
    end



end





