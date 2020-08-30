require './lib/person'
require 'date'
require 'pry'


describe Person do
  let(:person) { 'Jhon' }
  let(:books) { instance_double(name: 'Jhon', title: 'A High Wind in Jamaica', return_date: '2017-12-06')}


  it 'person exist?' do
    expect(subject.set_person(person)).to eq person
   end

  #it 'person do not exist' do
  #  expect(subject.name).to raise_error 'No person register'
  #end


end