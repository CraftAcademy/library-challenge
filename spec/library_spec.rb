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

    it 'finds available set to true for 3rd book' do
        expected_output = [{:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>"08/10/19"}] 
        expect(subject.isAval("pippi")).to eq expected_output
    end

   # it 'finds available set to false for 3rd book' do
    #    expected_output = [{:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil}] 
     #   expect(subject.unAval("pippi")).to eq expected_output 
    #end

    it 'has a set expiration date' do #WIP
        expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"08/10/19"}]
        expect(subject.return_date_method("Alfons och soldatpappan")).to eq expected_output
    end

   # it 'finds available = false' do #WIP
    #    expect(subject.unAval("osynligt")).to include({:item=>{:title=>"Osynligt med Alfons"}, :available=>false}) 
    #end
    it 'finds available set to FALSE for 3rd book' do
        expected_output = [{:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"08/10/19"}] 
        expect(subject.unAval("osynligt")).to eq expected_output
    end
    

   
end 
