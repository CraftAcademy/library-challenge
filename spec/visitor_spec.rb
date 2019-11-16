require "library.rb"
require "visitor.rb"

describe Visitor do
    
    subject {described_class.new}
    
   
    
 
it 'is expected to see list of books' do
    expect(subject.see_list).not_to be nil
end
end 