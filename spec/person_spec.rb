require './lib/person'
require 'date'
require 'pry'



describe Person do
  let(:person) { 'Jhon' }
  let(:books) { instance_double('Books', name: 'Jhon', title: 'Thunder Bay') }

  it 'person exist?' do
    expect(subject.set_person(person)).to eq person
    

   end
   
  #it 'person do not exist' do
  #  expect(subject.name).to raise_error 'No person register'
  #end

   it 'has a book?' do
    
    expect(subject.books_in_possession('Thunder Bay')).to eq ('Thunder Bay')
    binding.pry
   end
end