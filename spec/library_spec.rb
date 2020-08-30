require './lib/library'
require 'pry'

describe Library do
  it 'there is a collection with books in it' do
    expect(subject.collection).to be_truthy
  end

  it 'when searching for author we get all the books for that author' do
    expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil},
    {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"},
     :available=>true,
     :return_date=>nil}]
    expect(subject.search_by_author("As")).to eq expected_output
  end

  it 'deactivates book using the instance method' do
    subject.checkout
    expect(subject.book_checkout).to eq :false
  end


  # it 'a book is checked out' do

  # end
end