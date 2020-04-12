require './lib/library.rb'
require 'date'
require 'yaml'

describe Library do
  subject { described_class.new()}
  it 'has collection on initialize' do
    expect(subject.collection).to be_truthy
  end
  
  it 'be able to view collection' do
    subject.view_collection
  end 

  it 'searches for a book title in collection' do
    expect(subject.search('Pippi Långstrump') ).to include(include(:available))
  end
  it 'searches for a book author in collection' do
    expect(subject.search('Astrid Lindgren') ).to include(include(:available))
  end
  it 'searches for a book author not in the collection' do
    expect(subject.search('Strindberg') ).to eq 'no such book'
  end

  it 'checks out a book in the collection' do
    expect(subject.check_out('Madicken')).to include(available: false)
    # subject.check_out('Madicken')
  end
  
  it 'has return date for checked out book' do
  expect(subject.check_out('Madicken')).to include(return_date: Date.today.next_month(1).strftime("%Y/%m/%d"))
 end 
end



