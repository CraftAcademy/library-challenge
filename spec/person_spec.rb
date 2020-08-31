require './lib/person'
require 'date'
require 'pry'



describe Person do
  

  it 'person exist?' do
    person2= double(name: 'Jhon' )
    expect(subject.set_person(person2)).to eq person2
   end
   
  #it 'person do not exist' do
   # x=Person.new
    #expect(subject.new).to raise_error 'No person register'
    #binding.pry
  #end

end