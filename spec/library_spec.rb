require 'yaml'
require './lib/library.rb' #links to this file so the tests can refer to this code
require 'pry'

describe Library do 
    #let(:catalog)  { instance_double( title: 'Lord of the rings', author: 'JRR Tolkien', available: true ) }
      
#before { subject.add_book}
        

    it 'view all books' do
    expected_output = YAML.load_file('./lib/data.yml')
    expect(subject.catalog).to eq expected_output
    end

    it 'search for books by title' do
        expected_output = YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title].include? "Pippi Långstrump"  }
        expect(subject.title_search("Pippi Långstrump")).to eq expected_output
    end

    it 'search for books by author' do
        expected_output = YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:author].include? "Astrid"  }
        expect(subject.author_search("Astrid")).to eq expected_output
    end

    it 'book to check out' do
        expected_output = YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title] == "Pippi Långstrump" }
        expect(subject.book_to_checkout('Pippi Långstrump')).to eq expected_output
    end 

    it 'message to user"checkout complete, return book on {return_date}" ' do
        #binding.pry
        expected_output = { message: 'Checkout complete', return_date: '03/08/20' } 
        expect(subject.checkout("Pippi Långstrump")).to eq expected_output
    end

    it 'message to user"checkout incomplete,book unavailable" ' do
        expected_output = 'Checkout incomplete, book unavailable.'
        expect(subject.book_availability?("Pippi Långstrump")).to eq expected_output
    end

    
end


    #it 'book status updated when checkedout'

   

    









