require 'yaml'
require './lib/library.rb'

describe Library do

  it 'should have a library of books' do
    expect(subject.books).not_to be nil
  end

  it 'should be able to search by title' do
    expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
    expect(subject.search('Pippi')).to eq expected_output
  end

  it 'should be able to search by author' do
    expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
    expect(subject.search('Astrid')).to eq expected_output
  end

  it 'should be able to check availability' do
    expected_output = [{:item=>
      {:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil},
      {:item=>
        {:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil},
        {:item=>
          {:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil},
          {:item=>{
            :title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
    expect(subject.availability).to eq expected_output
  end
end
