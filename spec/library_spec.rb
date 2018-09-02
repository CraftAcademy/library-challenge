require './lib/library.rb'
require 'Date'

describe Library do

    after do
        original_data = YAML.load_file('./lib/data_restore.yml')
        File.open('./lib/data.yml', 'w') { |f| f.write original_data.to_yaml }
    end

    it "shows list of book" do #rather has one or more books..
    expect(subject.collection).not_to be_nil
    end

    it "shows all available books" do
        expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:available] == true }
#        expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>"2019-05-25"}, {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
        expect(subject.books_available).to eq expected_output
    end

    it "allows to search for specific book" do
        expected_output = YAML.load_file('./lib/data.yml').select { |book| book[:item][:title].include? "Pippi Långstrump" }
        expect(subject.search('Pippi Långstrump')).to eq expected_output
    end

    it "successfully lend out a book" do
        expected_output = [{:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>nil}]
        expect(subject.check_out("Osynligt med Alfons")).to eq expected_output
    end

    it "book not available to lend out" do
        expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil}]
        expect(subject.check_out("Pippi Långstrump")).to eq expected_output
    end
    

end