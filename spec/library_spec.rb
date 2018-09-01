require './lib/library.rb'
require 'Date'

describe Library do

    it "shows list of book" do
    expect(subject.collection).not_to be_nil
    end

    it "shows all available books" do
        expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>"2019-05-25"}, {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
        expect(subject.books_available).to eq expected_output
    end

    it "allows to search specific book" do
        expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
        expect(subject.search('Pippi Långstrump')).to eq expected_output
    end

    it "successfully lend out a book" do
        expect(subject.check_out("Pippi Långstrump")).to eq expected_output
        expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil}]
    end

    it "book not available to lend out" do
        expect(subject.check_out).to eq expected_output
        expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil}]
    end
    

end