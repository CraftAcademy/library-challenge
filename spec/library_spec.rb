require 'yaml'
require './lib/library'

describe Library do
  before do
    subject.books = YAML.load_file('./lib/data_reset.yml')
  end
#resetta data.yml innan du börjar
  it 'should have books available' do
    expect(subject.books).not_to be nil
  end
#change this to lambda??? to long maybe
  it 'can check which books are available' do
    expected_output = [{:title=>"Alfons och soldatpappan", :author=>"Gunilla Bergström"}, {:title=>"Osynligt med Alfons", :author=>"Gunilla Bergström"}, {:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, {:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}]
    expect(subject.what_is_available?).to eq expected_output
  end

  it 'can search for a specific book' do
    expected_output = [{:item=>{:title=>"Pippi Långstrump", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Pippi Långstrump går ombord", :author=>"Astrid Lindgren"}, :available=>true, :return_date=>nil}]
    expect(subject.search('Pippi')).to eq expected_output
  end

  describe 'be able to check-out a book' do
    let(:philip) { instance_double('Individual', name: 'Philip Zudemberg') }

    before {
      subject.search('Skratta lagom! Sa pappa Åberg').map{|obj| obj[:available] = true}
      File.open('./lib/data.yml', 'w') { |f| f.write @books.to_yaml }
    }

    it 'Should set so available: false upon lending' do
      subject.borrow('Skratta lagom! Sa pappa Åberg', philip)
      expect(subject.search('Skratta lagom! Sa pappa Åberg').map{|obj| obj[:available]}).to eq [false]
    end

    it 'Should be in the individuals possession after lending' do
      subject.borrow('Alfons och soldatpappan', philip)
      expect(subject.search('Alfons och soldatpappan').map{|obj| obj[:current_possessor]}).to eq ['Philip Zudemberg']
    end

    it 'should set a return_date on that book' do
      subject.borrow('Alfons och soldatpappan', philip)
      expect(subject.search('Alfons och soldatpappan').map{|obj| obj[:return_date]}).to eq [Date.today.next_month(1).strftime('%d/%m/%y')]
    end

    describe 'Rodrigo tries to borrow a book that is lended to Philip' do
      let(:rodrigo) { instance_double('Individual', name: 'Rodrigo') }

      it 'should raise an error if book is not available' do
        subject.borrow('Skratta lagom! Sa pappa Åberg', rodrigo)
        expect{subject.borrow('Skratta lagom! Sa pappa Åberg', philip)}.to raise_error 'Book is not available right now'
      end

      describe 'A person should be able to return a book' do

        it 'should be set available:true upon returning' do
          subject.return('Alfons och soldatpappan')
          expect(subject.search('Alfons och soldatpappan').map{|obj| obj[:available]}).to eq [true]
        end

        it 'should set current_possessor to nil' do
          subject.return('Alfons och soldatpappan')
          expect(subject.search('Alfons och soldatpappan').map{|obj| obj[:current_possessor]}).to eq ['nil']
        end

        it 'should set return_date to nil' do
          subject.return('Alfons och soldatpappan')
          expect(subject.search('Alfons och soldatpappan').map{|obj| obj[:return_date]}).to eq ['nil']
        end
      end
    end
  end
end
