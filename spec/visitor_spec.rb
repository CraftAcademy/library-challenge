require './lib/visitor.rb'
require 'date'

describe Visitor do
 it 'visitor should see the book list' do 
    expect(subject.show_list).to_not eq nil
 end  

 it 'visitor should see books title' do 
    expect(subject.see_title).to_not eq nil 
 end

 it 'visitor should see books author' do 
    expect(subject.see_author).to_not eq nil
end

it 'visitor can view the available books' do
    expect(subject.see_available_books).to_not eq false 
end 




end