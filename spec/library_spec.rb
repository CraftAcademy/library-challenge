require 'yaml'
require './lib/library'

describe Library do

  it 'should have books available' do
    expect(subject.books).not_to be nil
  end

  # it 'can check which books are available' do
  #   expected_output = { }
  #   expect(subject.available(nil)).to eq expected_output
  # end

  it 'can search for a specific book' do
    expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
    expect(subject.search('Pippi')).to eq expected_output
  end
end
