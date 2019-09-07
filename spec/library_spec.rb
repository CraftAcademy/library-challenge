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

    it 'finds available set to false for 3rd book' do
        expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}] 
        expect(subject.aval).to eq expected_output
    end

    it 'finds available set to true for 3rd book' do
        expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}] 
        expect(subject.isAval).to eq expected_output
    end
end
