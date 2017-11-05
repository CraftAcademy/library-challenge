require './lib/person'
require 'yaml'

describe Person do

  subject { described_class.new(name: 'Lisa', books: [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>false, :return_date=>"05/12/17"}] ) }

  it 'is expected to have a :name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'is expected that person can see their checked out books and due dates' do
    expect(subject.add_book("Alfons och soldatpappan")).to be_kind_of(Array)
  end

end
