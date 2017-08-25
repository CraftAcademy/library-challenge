require './lib/library.rb'
require 'date'
require 'yaml'

describe Library do

    let(:list) { subject.load_yaml('./lib/testYaml.yml') }

    it 'properly setup YAML file should load correctly' do
      expected_output = [{:item=>{:title=> 'test book in',
        author: 'magnus'},
        available: true,
        return_date: nil},
        {:item=>{:title=> 'test book not in',
          :author=> 'magnus'},
          :available=> false,
          :return_date=> '2017-09-20'}]
      expect(subject.load_yaml('./lib/testYaml.yml')).to eq expected_output
    end

    xit 'should write to YAML file' do
      list = subject.return_a_book(list, 'test book not in')
      subject.write_to_yaml(list)
      expected_output = [{:item=> {:title=> 'test book in',
        :author=> 'magnus'},
        :available=> true,
        :return_date=> nil},
        {:item=>{:title=> 'test book not in',
          :author=> 'magnus'},
          :available=> true,
          :return_date=> nil}]
      expect(subject.load_yaml('./lib/testYaml.yml')).to eq expected_output
    end

    it 'checks the return date' do
      date = Date.today
      due = Date.today.next_month
      expect(subject.return_date(date)).to eq due
    end

    it 'should print out a list of books' do
      expected_output = [{:item=> {:title=> 'test book in',
        :author=> 'magnus'},
        :available=> true,
        :return_date=> nil},
        {:item=> {:title=> 'test book not in',
          :author=> 'magnus'},
          :available=> false,
          :return_date=> '2017-09-20'}]
      expect(subject.list_books(list)).to eq expected_output
    end

    it 'should only print available books' do
      expected_output = [{:item=> {:title=> 'test book in',
        :author=> 'magnus'},
        :available=> true,
        :return_date=> nil}]
      expect(subject.book_available(list)).to eq expected_output
    end

    it 'when are the books due to return' do
      expected_output = [{:item=> {:title=> 'test book not in',
        :author=> 'magnus'},
        :available=> false,
        :return_date=> '2017-09-20'}]
      expect(subject.books_out(list)).to eq expected_output
    end

    it 'can borrow a book and the return date is correct' do
      due = Date.today.next_month
      expected_output = "The book is available and you need to return it no later than #{due}"
      expect(subject.borrow_a_book(list, 'test book in')).to eq expected_output
    end

    it 'can not borrow book if not available' do
      expected_output = 'That book is not available until 2017-09-20'
      expect(subject.borrow_a_book(list, 'test book not in')).to eq expected_output
    end

    it 'return a book' do
      list = YAML.load_file('./lib/testYaml.yml')
      expect(subject.return_a_book(list, 'test book not in')).to eq "Thank you for returning the book"
    end
  end
