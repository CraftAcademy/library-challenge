require './lib/library.rb'
require 'date'
require 'yaml'

describe Library do

    it 'loads data.yml file' do
        expect(subject.collection).to be_instance_of(Array)
    end
    
    it "displays books' title and author" do
        expect(subject.title_author).to eq ([{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, {:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, {:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, {:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, {:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}])
    end

    it 'changes availability to false when book is checked out' do
        subject.check_out("Alfons och soldatpappan")
        expect(subject.is_available("Alfons och soldatpappan")).to eq false
    end

    it 'changes availability to true when book is checked in' do
        subject.check_in("Alfons och soldatpappan")
        expect(subject.is_available("Alfons och soldatpappan")).to eq true
    end

    it 'displays return date as 30 days from check out date' do
        subject.check_out("Alfons och soldatpappan")
        return_date = Date.today.next_day(30).strftime('%Y/%m/%d')
        expect(subject.set_return_date("Alfons och soldatpappan")).to eq return_date
    end

    it 'issues a receipt with return date when book is checked out' do
        expect(subject.check_out("Osynligt med Alfons")).to be_a_kind_of(Hash)
    end

    it 'issues a receipt with return date when book is checked in' do
        expect(subject.check_in("Osynligt med Alfons")).to be_a_kind_of(Hash)
    end

end


   