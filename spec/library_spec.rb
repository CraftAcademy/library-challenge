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

  it 'a book gets checked out ' do
    expect(subject.checkout('Osynligt med Alfons')).to eq 575
  end

  # it 'user receives a message with return date' do
  #   expect(subject.receipt).to eq 'thank you for the visit, please return before'
  # end

  it 'user receives a message with return date' do
    expect(subject.receipt).to eq "Thank you for lending our books, your return date is 09/30"
  end
end