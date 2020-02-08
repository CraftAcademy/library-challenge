require 'yaml'
require './lib/library.rb' #links to this file so the tests can refer to this code

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


    it 'message to user"checkout complete, return book on {return_date}" ' do
        expected_output = { message: 'checkout complete', return_date: '08/04/2020' } 
        expect(subject.checkout_message(true)).to eq expected_output
    end

    it 'message to user"checkout incomplete,book unavailable" ' do
        expected_output = { message: 'checkout incomplete,book unavailable', } 
        expect(subject.checkout_message(false)).to eq expected_output
    end

    
end


    #it 'book status updated when checkedout'

   

    









