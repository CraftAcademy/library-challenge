require 'yaml'
require './lib/library.rb'
require './lib/patron.rb'

describe Patron do

  it 'should have no books on initialize' do
    expected_output = [{"item"=>{:title=>nil, :author=>nil}, :return_date=>nil}]
    expect(subject.borrowed_books).to eq expected_output
  end

  it 'should be able to borrow books' do
    subject.borrow('Pippi Långstrump')
    expected_output = [{:item=>{:title=>'Pippi Långstrump', :author=>'Astrid Lindgren'}, :return_date=>Date.today.next_month(1).strftime('%d/%m')}]
    expect(subject.borrowed_books).to eq expected_output
  end


end
