require 'yaml'
require './lib/library'

describe Library do

  it 'should have books available' do
    expect(subject.books).not_to be nil
  end

#change this to lambda??? to long maybe
  it 'can check which books are available' do
    # command = lambda {subject.what_is_available?}
    # expect(command.call).to be_truthy
    expected_output = [{:item=>{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
    expect(subject.what_is_available?).to eq expected_output
  end

  it 'can search for a specific book' do
    expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
    expect(subject.search('Pippi')).to eq expected_output
  end

  describe 'be able to lend a book' do
    # let(:person) { instance_double('Person'}
    before {
      subject.search('Skratta lagom! Sa pappa Åberg').map{|obj| obj[:available] = true
      File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }}
    }

    # before do
    #   allow(person).to receive(:borrowed_books).and_return({:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil})
    # end


    it 'Should set so available: false upon lending' do
      subject.borrow('Skratta lagom! Sa pappa Åberg')
      expected_output = [{:item=>{:title=>'Skratta lagom! Sa pappa Åberg', :author=>"Gunilla Bergström"}, :available=>false, :return_date=>nil}]
      expect(subject.search('Skratta lagom! Sa pappa Åberg')).to eq expected_output
    end
  end

    # it 'should set a return_date on that book' do
      # philip.borrow('Pippi Långstrump går ombord')
      # expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>false, :return_date=>nil}
    # end
    #
    # it 'should set so current owner of that book is person' do
    #
    # end

    # it 'should give an error if book is not available' do
    #
    # end
    #
    #
    # it 'A person should be able to return a book' do
    #    == true
    # end
  # end
end
