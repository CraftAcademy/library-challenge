require './lib/visitor.rb'
require 'date'

describe Visitor do
 it 'visitor should see the book list' do 
    expect(subject.show_list).to_not eq nil
 end   
end