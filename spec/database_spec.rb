#In order to the customers know what books are available to get borrowed, we need to create a database for them to interact with. 
require './lib/database.rb'
require 'pry'


describe Database do

  it 'has books availables' do
    expect(subject.books).to eq 10 
    
  end
  






end

