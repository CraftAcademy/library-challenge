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
    expected_output = [{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, {:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, {:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, {:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}]
    expect(subject.what_is_available?).to eq expected_output
  end

  it 'can search for a specific book' do
    expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
    expect(subject.search('Pippi')).to eq expected_output
  end

  describe 'be able to check-out a book' do
    let(:individual) { instance_double('Philip', name: 'Philip Zudemberg') }
    before {
      subject.search('Skratta lagom! Sa pappa Åberg').map{|obj| obj[:available] = true}
      File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
    }

    # it 'should raise an error if book is not available' do
    #  expect { subject.borrow('Skratta lagom! Sa pappa Åberg') }.to raise_error 'Book is not available right now'
    # end

    it 'Should set so available: false upon lending' do
      subject.borrow('Skratta lagom! Sa pappa Åberg', individual.name)
      expect(subject.search('Skratta lagom! Sa pappa Åberg').map{|obj| obj[:available]}).to eq [false]
    end

    it 'Should be in the individuals possession after lending' do
     subject.borrow('Skratta lagom! Sa pappa Åberg', individual.name)
      expect(subject.search('Skratta lagom! Sa pappa Åberg').map{|obj| obj[:current_possessor]}).to eq [(individual.name)]
    end
  end
end

    # it 'should set a return_date on that book' do
    # {subject.borrow('Skratta lagom! Sa pappa Åberg', invidivual.name)}
    #  expect{subject.search('Skratta lagom! Sa pappa Åberg').map{|obj| obj[:return_date]}}.to eq Date.today.next_month(1).strftime('%d/%m/%y')}
    # end
    #



    # it 'A person should be able to return a book' do
    #    == true
    # end
