require 'yaml'
require './lib/visitor.rb'


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

    end


end