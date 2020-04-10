require 'yaml'
require './lib/visitor.rb'


describe Visitor do 

    it "Can find a list of all the books" do
    expect(subject.show_list).to eq [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}] 
    end



end