require './lib/database.rb'
require 'yaml'
require 'pry'


#In order for the customers to know what books are available to get borrowed, 
#we need to create a database for them to interact with. 



describe Database do

  it 'has books availables' do
    @books = YAML.load_file('./lib/data.yml')
    expect(subject.books).to eq @books
    
  end

  #In order to search books using the title as a reference,
  #we need to create a function that allow us to list the authors

  it 'shows the books that are available by their title' do
    
    expect(subject.items_by_title).to_not eq nil


  end
  








end

