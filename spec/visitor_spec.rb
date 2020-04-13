require 'yaml'
require './lib/visitor.rb'
require 'date'


describe Visitor do


    it 'Can find a list of all the books' do
    expect(subject.show_list).to eq [{:item=>{:title=>'Alfons och soldatpappan', :author=>'Gunilla Bergström'}, :available=>true, :return_date=>nil}] 
    end

    it 'Can search for book title' do 
    expect(subject.search_title('Alfons')).to eq [{:item=>{:title=>'Alfons och soldatpappan', :author=>'Gunilla Bergström'}, :available=>true, :return_date=>nil}]
    end

    it 'Can check availability of a book' do 
    expect(subject.check_status_book('Alfons')).not_to be nil
    end

    describe 'Can check out book' do

        it "The book is added into visitor's account" do
        expect(subject.check_out_book('Alfons och soldatpappan')).to be_truthy
        end

        it 'The book becomes unavailable upon checkout' do
        subject.check_out_book('Alfons och soldatpappan')
        book_to_test = YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title].include? 'Alfons och soldatpappan' }
        expect(book_to_test[0][:available]).to eq false
        end

        it "Receives receipt with return date one month from today's date" do 
        subject.check_out_book('Alfons och soldatpappan')
        expected_date = Date.today.next_month(1).strftime('%d/%m/%y')
        expected_outcome = {message:"The book is due before the following date: #{expected_date}"}
        end
    end

    describe 'Can return book' do
    
        it 'The book becomes available upon checkin' do
            subject.check_in_book('Alfons och soldatpappan')
            returned_book = YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title].include? 'Alfons och soldatpappan' }
            expect(returned_book[0][:available]).to eq true
        end
    end
end