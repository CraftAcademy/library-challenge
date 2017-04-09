require 'date'
require 'pry-byebug'
require './lib/person.rb'
require './lib/library.rb'


describe Library do

  it 'checks that there is a collection of books' do
    expect(:book).not_to be_empty
  end

  it 'checks if a book is available' do
    expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil},
      {:item=>{:title=>"Skratta lagom! Sa pappa Åberg", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil},
      {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil},
      {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
    expect(subject.book_available).to eq expected_output
  end

end
