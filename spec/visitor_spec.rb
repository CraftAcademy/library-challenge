require './lib/visitor.rb'
require './lib/library.rb'
require 'date'

describe Visitor do

    

    it 'can check what books are available for rent' do
        expected_outcome = [
            {:available=>true, :item=>{:author=>"J.R.R. Tolkien", :title=>"Lord of the Rings"}, :return_date=>nil},
            {:available=>true, :item=>{:author=>"Eric Nylund", :title=>"Halo: Fall of Reach"}, :return_date=>nil},
            {:available=>true, :item=>{:author=>"E.L. James", :title=>"Fifty Shades of Grey"}, :return_date=>nil}
        ]
        expect(subject.see_available).to eq expected_outcome
    end
    
    
    #rent_the_book
    #see_currently_owned
    #return_the_book

end