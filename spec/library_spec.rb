require './lib/library.rb'
require 'date'
require 'yaml'

describe Library do

    it 'loads data.yml file' do
        expect(subject.collection).to be_instance_of(Array)
    end
    
    it "displays books' title and author" do
        expect(subject.display_title_author).to eq ([{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, {:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, {:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, {:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, {:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}])
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
        expect(subject.has_return_date("Alfons och soldatpappan")).to eq return_date
    end

    it 'issues a receipt with return date when book is checked out' do
        expect(subject.check_out("Osynligt med Alfons")).to be_a_kind_of(Hash)
    end

    it 'issues a receipt with return date when book is checked in' do
        expect(subject.check_in("Osynligt med Alfons")).to be_a_kind_of(Hash)
    end


    #it 'is expected to raise error if book is unavailable' do
        #subject.check_out("Alfons och soldatpappan")
        #expect(subject.unavailable_book).to raise_error 'The selected book is not available'   
    #end
    #it 'displays return date as 30 days from check out date' do
           #allow(book).to receive(:return_date).and_return('27/02/2019')
            #expected_output = { : false, message: 'card expired', date: Date.today }
            #expect(subject.withdraw(6, '1234', account)).to eq expected_output
        #end

    #it 'sets up a return date when checked out' do
        #expected_output = { available: false, message: 'success', date: Date.today }
        #expect(subject.set_return_date()).to eq expected_output
    #end
end

#it can be false when the book is not available / true if available

    #it 'gives a receipt when book is checked out' do
        #expected_output = { status: false, message: 'success', date: Date.today }
        #expect(subject.check_out()).to eq expected_output
    

    #it 'gives a receipt when book is checked in' do
        #expected_output = { status: true, message: 'success', date: Date.today }
        #expect(subject.check_in(45, '1234', account)).to eq expected_output
    #end
#end

   # 1)
   # item[:available] => true / false
   # check in -> change_status method true // checkout -> change_status false
   # receipt: when successfully checked in or out

   # 2)
   # date_today 
   # - when check out - set 30 days return date

   # 3) check_availability -> list of titles and authors (all books with availability or .filter and show only t4he available ones)
   # 4) when check in set return_date to '' (empty string)


    
   