require 'yaml'
require './lib/visitor.rb'
require 'date'


describe Visitor do 

    it "Can find a list of all the books" do
    expect(subject.show_list).to eq [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}] 
    end

    it 'Can search for book title' do 
    expect(subject.search_title('Alfons')).to eq [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}]
    end

    it 'Can check status availability' do 
    expect(subject.check_status_book('Alfons')).not_to be nil
    end

    describe'Can check out book' do

        it "Add book into visitor account"do
        expect(subject.check_out_book('Alfons och soldatpappan')).to be_truthy
        end

        it 'The book becomes unavailable upon checkout' do
        subject.check_out_book('Alfons och soldatpappan')
        expect(YAML.load_file('./lib/data.yml').select { |obj| obj[:item][:title].include? 'Alfons och soldatpappan' }[0][:available]).to eq false
        end

        it "Receive receipt with return date one month from today's date" do 
        subject.check_out_book('Alfons och soldatpappan')
        expected_date=Date.today.next_month(STANDARD_RETURN_DATE).strftime('%d/%m/%y')
        expected_outcome = {message:"The book is due before the following date: #{expected_date}"}
        
        
        end

    end



end