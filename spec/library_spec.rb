require './lib/library'
require 'pry'


describe Books do
  
  it 'Check if the list book exist' do
     expect(File.exist?('./lib/books_list.yml')).to be_truthy
     
  end

  
end
