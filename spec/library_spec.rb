require './lib/library.rb'
require 'date'

describe Library do
    
    it 'has the ability to show list of checked-out books' do
        expect(subject.collection).to include{:item}
    end

    it 'can search for author by input of argument' do
        subject.search_by_author("astrid")
        expect(subject).to be_truthy
    end

    it 'can search for title by input of argument' do
        subject.search_by_title("pippi")
        expect(subject).to be_truthy
    end

    it 'has a set expiration date' do
        expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"08/10/19"}]
        expect(subject.return_date_method("Alfons och soldatpappan")).to eq expected_output
    end

    it 'finds available set to true for 3rd book' do
        collection = YAML.load_file('./lib/data.yml')
        collection.select { |book| book[:item][:title].include? "Pippi Långstrump" }
        expect(subject.isAval("Pippi")).to include{[{:item=>{:title=>"Pippi Långstrump"}, :available=>true}]}
    end

    it 'finds available set to FALSE for 3rd book' do 
        collection = YAML.load_file('./lib/data.yml')
        collection.select { |book| book[:item][:title].include? "Osynligt med Alfons" }
        expect(subject.unAval("Osynligt med Alfons")).to include{[{:item=>{:title=>"Osynligt med Alfons"}, :available=>false}]} 
    end

    it 'checks-out book and sends message stating return date' do
        expect(subject.check_out("Skratta lagom! Sa pappa Åberg")).to include { ('You have checked-out the book.') }
    end
end 
