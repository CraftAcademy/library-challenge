require './lib/library.rb'
require 'date'
require 'yaml'

describe Library do

    it 'properly setup YAML file should load correctly' do
      expected_output = [{:item=>{:title=>'test book', author: 'magnus'}, available: true, return_date: '2017-08-20'}]
      expect(subject.load_yaml('./lib/testYaml.yml')).to eq expected_output
    end

    it 'checks the return date' do
      date = Date.today
      due = Date.today.next_month
      expect(subject.return_date(date)).to eq due
    end

    it 'should print out a list of books' do
      list = subject.load_yaml('./lib/testYaml.yml')
      # expected_output = "#{'test book'} #{'magnus'} available"
      expected_output = [{:item=>{:title=>"test book", :author=>"magnus"}, :available=>true, :return_date=>"2017-08-20"}]
      expect(subject.list_books(list)).to eq expected_output
    end
  end
